using Bless.Models;

namespace Bless.BusinessLogic.Interfaces
{
    public interface IReserva
    {
        Task<Response<bool>> GuardarReservaAsync(ReservaRequest request);
        Task<Response<List<HorarioDisponible>>> ListarHorariosDisponiblesAsync(int barberoId, DateTime fecha);
    }
}
