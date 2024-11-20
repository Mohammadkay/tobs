using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;

public static class AppConfig
{
    public static LoggingOptions Logging { get; set; }
    public static string AllowedHosts { get; set; }
    public static SerilogOptions Serilog { get; set; }
    public static JwtOptions Jwt { get; set; }
    public static ConnectionStringsOptions ConnectionStrings { get; set; }
    public static LocalSettingsOptions LocalSettings { get; set; }
}

public class LoggingOptions
{
    public LogLevelOptions LogLevel { get; set; }
}

public class LogLevelOptions
{
    public string Default { get; set; }
    public string MicrosoftAspNetCore { get; set; }
}

public class SerilogOptions
{
    public List<string> Using { get; set; }
    public MinimumLevelOptions MinimumLevel { get; set; }
    public List<WriteToOptions> WriteTo { get; set; }
}

public class MinimumLevelOptions
{
    public string Default { get; set; }
}

public class WriteToOptions
{
    public string Name { get; set; }
    public ArgsOptions Args { get; set; }
}

public class ArgsOptions
{
    public string Path { get; set; }
    public string RollingInterval { get; set; }
    public int RetainedFileCountLimit { get; set; }
    public bool RollOnFileSizeLimit { get; set; }
    public long FileSizeLimitBytes { get; set; }
    public string OutputTemplate { get; set; }
}

public class JwtOptions
{
    public string Key { get; set; }
    public string Issuer { get; set; }
    public string Audience { get; set; }
}

public class ConnectionStringsOptions
{
    public string DefaultConnection { get; set; }
    public string Redis { get; set; }
}

public class LocalSettingsOptions
{
    public bool LogRequestResponse { get; set; }
    public string[] AllowedURLs { get; set; }
}
