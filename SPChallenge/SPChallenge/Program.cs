using Infrastructure.Data;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Serilog;
using Serilog.Events;
using Service.Interface;
using Service.Services;
using Service.UnitOfWork;
using SPChallengeAPI.Extensions;
using SPChallengeAPI.MiddleWare;
using System.Text;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();

builder.Services.AddServices(builder.Configuration);

builder.Host.UseSerilog((context, configuration) =>
                                   configuration.ReadFrom.Configuration(context.Configuration)
                                   .MinimumLevel.Verbose()
                                   .Filter.ByIncludingOnly(logEvent =>
                                   logEvent.Level == LogEventLevel.Error ||
                                  (logEvent.Level == LogEventLevel.Information &&
                                  (logEvent.MessageTemplate.Text.Contains("SPLog") || logEvent.MessageTemplate.Text.ToLower().Contains("error")))
                         ));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

using var scope = app.Services.CreateScope();
var services = scope.ServiceProvider;

try
{
    var context = services.GetRequiredService<DBChallange>();
    await context.Database.MigrateAsync();
    await SeedData.Seed(context);
}
catch (Exception ex)
{
    var logger = services.GetService<ILogger<Program>>();
    logger.LogError(ex, "Fail during migration on program : " + ex.Message);
}

app.UseCors(builder => builder.AllowAnyHeader().AllowAnyMethod().WithOrigins(AppConfig.LocalSettings.AllowedURLs));

app.UseSerilogRequestLogging();

app.UseMiddleware<ExceptionMiddleware>();

app.UseStaticFiles();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
