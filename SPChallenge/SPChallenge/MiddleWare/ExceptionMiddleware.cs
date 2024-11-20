using Azure;
using System.Net;
using System.Text;
using System.Text.Json;

namespace SPChallengeAPI.MiddleWare
{
    public class ExceptionMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly IHostEnvironment _env;
        private readonly Serilog.ILogger _logger;

        public ExceptionMiddleware(RequestDelegate next, IHostEnvironment env, Serilog.ILogger logger)
        {
            _env = env;
            _next = next;
            _logger = logger;
        }

        public async Task InvokeAsync(HttpContext context)
        {
            var originalBodyStream = context.Response.Body;

            try
            {
                if (AppConfig.LocalSettings.LogRequestResponse)
                {
                    string request = await FormatRequest(context.Request);
                    string response = await CaptureResponse(context, originalBodyStream);

                    _logger.Information(await FormatLogRequestResponse(request, response));
                }
                else
                {
                    await _next(context);
                }
            }
            catch (Exception ex)
            {
                await HandleException(context, originalBodyStream, ex);
            }
        }

        private async Task<string> CaptureResponse(HttpContext context, dynamic originalBodyStream)
        {
            string response;

            using (var responseBody = new MemoryStream())
            {
                context.Response.Body = responseBody;

                await _next(context);

                response = await FormatResponse(context.Response);

                responseBody.Seek(0, SeekOrigin.Begin);
                await responseBody.CopyToAsync(originalBodyStream);
            }

            return response;
        }

        private async Task HandleException(HttpContext context, dynamic originalBodyStream, Exception ex)
        {
            string request = await FormatRequest(context.Request);
            context.Response.ContentType = "application/json";
            context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;

            var errorMessage = _env.IsDevelopment()
                ? new ResponseResult<string>
                {
                    Status = Core.Enums.ResultStatus.Fail,
                    Errors = new List<string> { ex.Message, ex.StackTrace }
                }
                : new ResponseResult<string>
                {
                    Status = Core.Enums.ResultStatus.Fail,
                    Errors = new List<string> { ex.Message }
                };

            var options = new JsonSerializerOptions { PropertyNamingPolicy = JsonNamingPolicy.CamelCase };
            var json = JsonSerializer.Serialize(errorMessage, options);

            _logger.Error(await FormatLogRequestResponse(request, json));
            context.Response.Body = originalBodyStream;

            await context.Response.WriteAsync(json);
        }

        private async Task<string> FormatRequest(HttpRequest request)
        {
            request.EnableBuffering();

            using (var reader = new StreamReader(request.Body, Encoding.UTF8, true, 1024, true))
            {
                var body = await reader.ReadToEndAsync();
                request.Body.Position = 0;
                return $"{request.Method} {request.Path} {request.QueryString} {body}";
            }
        }

        private async Task<string> FormatResponse(HttpResponse response)
        {
            response.Body.Seek(0, SeekOrigin.Begin);
            var body = await new StreamReader(response.Body).ReadToEndAsync();
            response.Body.Seek(0, SeekOrigin.Begin);
            return $"Status Code: {response.StatusCode}, Body: {body}";
        }

        public async Task<string> FormatLogRequestResponse(string request, string response)
        {
            StringBuilder str = new StringBuilder();
            str.AppendLine("SPLog Request : ");
            str.AppendLine(request);
            str.AppendLine();
            str.AppendLine("SPLog Response : ");
            str.AppendLine(response);
            return str.ToString();
        }
    }
}
