using Bless.Booking.Service;
using Bless.BusinessLogic;
using Bless.BusinessLogic.Interfaces;
using DET.Common;
using System.Net;

var builder = WebApplication.CreateBuilder(args);
const string CorsPolicyName = "AllowFrontend";

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
var isDevelopment = builder.Environment.IsDevelopment();

builder.Services.AddCors(options =>
{
    options.AddPolicy(CorsPolicyName, policy =>
    {
        policy
            .SetIsOriginAllowed(origin => IsAllowedCorsOrigin(origin, allowedOriginsSet, isDevelopment))
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

app.MapControllers();

app.MapHub<NotificacionHub>("/hub/notificaciones");

app.Run();

static bool IsAllowedCorsOrigin(string origin, ISet<string> allowedOrigins, bool isDevelopment)
{
    if (allowedOrigins.Contains(origin))
    {
        return true;
    }

    if (!isDevelopment || !Uri.TryCreate(origin, UriKind.Absolute, out var uri))
    {
        return false;
    }

    if (uri.Scheme is not "http" and not "https")
    {
        return false;
    }

    if (uri.Port is not 5173 and not 5174 and not 4173)
    {
        return false;
    }

    return uri.Host.Equals("localhost", StringComparison.OrdinalIgnoreCase)
        || uri.Host.Equals("::1", StringComparison.OrdinalIgnoreCase)
        || IsPrivateIpv4(uri.Host);
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
