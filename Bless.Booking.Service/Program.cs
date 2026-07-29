using Bless.Booking.Service;
using Bless.BusinessLogic;
using Bless.BusinessLogic.Interfaces;
using DET.Common;
using System.Net;

var builder = WebApplication.CreateBuilder(args);
const string CorsPolicyName = "AllowFrontend";

if (builder.Environment.IsDevelopment())
{
    builder.Configuration.AddJsonFile("appsettings.Local.json", optional: true, reloadOnChange: true);
    builder.Configuration.AddEnvironmentVariables();
}

builder.Logging.AddFilter("System.Net.Http.HttpClient.GooglePlacesService", LogLevel.Warning);

// Add services to the container.
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddMemoryCache();

builder.Services.AddHttpClient<GooglePlacesService>();

builder.Services.AddConfigServices();

// Add SignalR services.
builder.Services.AddSignalR();
builder.Services.AddSingleton<NotificacionService>();

var allowedOrigins = builder.Configuration
    .GetSection("Cors:AllowedOrigins")
    .Get<string[]>() ?? Array.Empty<string>();
var allowedOriginsSet = allowedOrigins.ToHashSet(StringComparer.OrdinalIgnoreCase);
var allowLocalDevelopmentOrigins = builder.Configuration.GetValue("Cors:AllowLocalDevelopmentOrigins", true);

builder.Services.AddCors(options =>
{
    options.AddPolicy(CorsPolicyName, policy =>
    {
        policy
            .SetIsOriginAllowed(origin => IsAllowedCorsOrigin(origin, allowedOriginsSet, allowLocalDevelopmentOrigins))
            .AllowAnyHeader()
            .AllowAnyMethod()
            .AllowCredentials();
    });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

if (!app.Environment.IsDevelopment())
{
    app.UseHttpsRedirection();
}

app.UseCors(CorsPolicyName);

app.UseAuthorization();

app.MapGet("/health", () => Results.Ok(new
{
    status = "ok",
    environment = app.Environment.EnvironmentName
}));

app.MapControllers();

app.MapHub<NotificacionHub>("/hub/notificaciones");

app.Run();

static bool IsAllowedCorsOrigin(string origin, ISet<string> allowedOrigins, bool allowLocalDevelopmentOrigins)
{
    if (allowedOrigins.Contains(origin))
    {
        return true;
    }

    if (!allowLocalDevelopmentOrigins || !Uri.TryCreate(origin, UriKind.Absolute, out var uri))
    {
        return false;
    }

    if (uri.Scheme is not "http" and not "https")
    {
        return false;
    }

    return uri.Host.Equals("localhost", StringComparison.OrdinalIgnoreCase)
        || uri.Host.Equals("0.0.0.0", StringComparison.OrdinalIgnoreCase)
        || IsLoopbackAddress(uri.Host)
        || IsPrivateIpv4(uri.Host);
}

static bool IsLoopbackAddress(string host)
{
    return IPAddress.TryParse(host, out var address) && IPAddress.IsLoopback(address);
}

static bool IsPrivateIpv4(string host)
{
    if (!IPAddress.TryParse(host, out var address))
    {
        return false;
    }

    var bytes = address.GetAddressBytes();
    if (bytes.Length != 4)
    {
        return false;
    }

    return bytes[0] == 10
        || bytes[0] == 127
        || bytes[0] == 192 && bytes[1] == 168
        || bytes[0] == 172 && bytes[1] >= 16 && bytes[1] <= 31;
}
