using Bless.Models;

namespace Bless.DataAccess.Interfaces
{
    public interface IReserva
    {
        Task<Response<bool>> GuardarReservaAsync(ReservaRequest request);
        Task<Response<List<HorarioDisponible>>> ListarHorariosDisponiblesAsync(int barberoId, DateTime fecha);
        Task<Response<List<Reserva>>> ListarReservasAsync(DateTime fecha, int barberoId);
    }
}
