using Bless.Booking.Service;
using Bless.BusinessLogic;
using Bless.BusinessLogic.Interfaces;
using DET.Common;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddHttpClient<GooglePlacesService>();

builder.Services.AddConfigServices();

// Añadir servicios de SignalR
builder.Services.AddSignalR();
builder.Services.AddSingleton<NotificacionService>();

builder.Services.AddCors(options =>
{
    options.AddPolicy("PermitirCORS", policy =>
    {
        policy.WithOrigins("https://localhost:7280") // URL del cliente Blazor
              .AllowAnyHeader()
              .AllowAnyMethod();
    });
});

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.MapHub<NotificacionHub>("/hub/notificaciones"); // Ruta del Hub

app.Run();
