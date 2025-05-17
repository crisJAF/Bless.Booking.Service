using Bless.Booking.Service;
using Bless.BusinessLogic;
using Bless.BusinessLogic.Interfaces;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddHttpClient<GooglePlacesService>();
builder.Services.AddSingleton<IReserva, Reserva>();
builder.Services.AddSingleton<Bless.DataAccess.Interfaces.IReserva, Bless.DataAccess.Reserva>();
builder.Services.AddSingleton<Bless.DataAccess.Interfaces.IConnectionManager, Bless.DataAccess.ConnectionManager>();
builder.Services.AddSingleton<IBarbero, Barbero>();
builder.Services.AddSingleton<Bless.DataAccess.Interfaces.IBarbero, Bless.DataAccess.Barbero>();
builder.Services.AddSingleton<IServicio, Servicio>();
builder.Services.AddSingleton<Bless.DataAccess.Interfaces.IServicio, Bless.DataAccess.Servicio>();

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

app.Run();
