using Infrastructure.Data;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Service.Interface;
using Service.UnitOfWork;
using System.Text;

namespace SPChallengeAPI.Extensions
{
    public static class ServiceExtentions
    {
        public static IServiceCollection AddServices(this IServiceCollection services,
        IConfiguration config)
        {
            services.AddEndpointsApiExplorer();
            services.AddSwaggerGen();

            services.AddScoped<IUnitOfWorkService, UnitOfWorkService>();

            #region Add DB Context
            services.AddDbContext<DBChallange>(
            opt =>
            {
                opt.UseSqlServer(config.GetConnectionString("DefaultConnection"));
            });
            #endregion

            #region Fill App Config
            AppConfig.Logging = config.GetSection("Logging").Get<LoggingOptions>();
            AppConfig.AllowedHosts = config["AllowedHosts"];
            AppConfig.Serilog = config.GetSection("Serilog").Get<SerilogOptions>();
            AppConfig.Jwt = config.GetSection("Jwt").Get<JwtOptions>();
            AppConfig.ConnectionStrings = config.GetSection("ConnectionStrings").Get<ConnectionStringsOptions>();
            AppConfig.LocalSettings = config.GetSection("LocalSettings").Get<LocalSettingsOptions>();
            #endregion

            #region Add JWT Token settings
            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme).AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateLifetime = true,
                    ValidateIssuerSigningKey = true,
                    ValidIssuer = AppConfig.Jwt.Issuer,
                    ValidAudience = AppConfig.Jwt.Audience,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(AppConfig.Jwt.Key))
                };
            });
            #endregion

            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
            services.AddHttpContextAccessor();

            return services;
        }
    }
}
