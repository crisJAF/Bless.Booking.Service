using Bless.BusinessLogic.Interfaces;
using Bless.Models;

namespace Bless.BusinessLogic
{
    public class Reserva : IReserva
    {
        private readonly DataAccess.Interfaces.IReserva? _reserva;

        public Reserva(DataAccess.Interfaces.IReserva reserva)
        {
            _reserva = reserva;
        }

        public async Task<Response<bool>> GuardarReservaAsync(ReservaRequest request)
        {
            return await _reserva.GuardarReservaAsync(request);
        }

        public async Task<Response<List<HorarioDisponible>>> ListarHorariosDisponiblesAsync(int barberoId, DateTime fecha)
        {
            return await _reserva.ListarHorariosDisponiblesAsync(barberoId, fecha);
        }
        public async Task<Response<List<Models.Reserva>>> ListarReservasAsync(DateTime fecha, int barberoId)
        {
            return await _reserva.ListarReservasAsync(fecha, barberoId);
        }
    }
}
