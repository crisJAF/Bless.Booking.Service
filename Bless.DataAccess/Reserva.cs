using Bless.DataAccess.Interfaces;
using Bless.Models;
using System.Data;
using Dapper;

namespace Bless.DataAccess
{
    public class Reserva : IReserva
    {
        private readonly IConnectionManager connectionManager;

        public Reserva(IConnectionManager connectionManager)
        {
            this.connectionManager = connectionManager;
        }

        public async Task<Response<bool>> GuardarReservaAsync(ReservaRequest request)
        {
            using var connection = connectionManager.GetConnectionString(ConnectionManager.connectionStringKey);

            await connection.ExecuteAsync(
                "sp_Reserva_Guardar",
                param: new
                {
                    request.Nombre,
                    request.Telefono,
                    request.Correo,
                    request.BarberoId,
                    request.ServicioId,
                    request.Fecha,
                    request.Hora
                },
                commandType: CommandType.StoredProcedure
            );

            return new Response<bool> { Content = true, IsSuccess = true, Message = "Reserva registrada correctamente." };
        }

        public async Task<Response<List<HorarioDisponible>>> ListarHorariosDisponiblesAsync(int barberoId, DateTime fecha)
        {
            using var connection = connectionManager.GetConnectionString(ConnectionManager.connectionStringKey);

            var result = await connection.QueryAsync<HorarioDisponible>(
                "SP_ListarHorariosDisponibles",
                param: new { BarberoId = barberoId, Fecha = fecha.Date },
                commandType: CommandType.StoredProcedure
            );

            return new Response<List<HorarioDisponible>>
            {
                Content = result.ToList(),
                IsSuccess = true,
                Message = "Horarios disponibles obtenidos correctamente."
            };
        }
        public async Task<Response<List<Models.Reserva>>> ListarReservasAsync(DateTime fecha, int barberoId)
        {
            using var connection = connectionManager.GetConnectionString(ConnectionManager.connectionStringKey);

            var result = await connection.QueryAsync<Bless.Models.Reserva>(
                "sp_ObtenerReservasPorFecha",
                param: new { Fecha = fecha.Date, BarberoId = barberoId },
                commandType: CommandType.StoredProcedure
            );
            return new Response<List<Models.Reserva>>
            {
                Content = result.ToList(),
                IsSuccess = true,
                Message = "Reservas obtenidas correctamente."
            };
        }
    }
}
