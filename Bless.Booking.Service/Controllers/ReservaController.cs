using Bless.BusinessLogic;
using Bless.BusinessLogic.Interfaces;
using Bless.Models;
using Microsoft.AspNetCore.Mvc;

namespace Bless.Booking.Service.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ReservasController : ControllerBase
    {
        private readonly IReserva _reservaService;
        private readonly NotificacionService _notificacionService;

        public ReservasController(IReserva reservaService, NotificacionService notificacionService)
        {
            this._reservaService = reservaService;
            _notificacionService = notificacionService;
        }

        // POST: api/reservas/guardar
        [HttpPost("guardar")]
        public async Task<IActionResult> GuardarReserva([FromBody] ReservaRequest request)
        {
            try
            {
                var result = await _reservaService.GuardarReservaAsync(request);
                if (result.IsSuccess)
                {
                    // Llama directamente al servicio de notificaciones
                    await _notificacionService.EnviarNotificacionAsync("Se ha realizado una nueva reserva");
                    return Ok(result);
                }
                else
                    return BadRequest(result);

            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        // GET: api/reservas/horarios?barberoId=1&fecha=2025-05-11
        [HttpGet("horarios")]
        public async Task<IActionResult> ListarHorariosDisponibles(int barberoId, DateTime fecha)
        {
            try
            {
                var result = await _reservaService.ListarHorariosDisponiblesAsync(barberoId, fecha);
                if (result.IsSuccess)
                    return Ok(result);
                else
                    return BadRequest(result);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex);
            }
        }

        // GET: api/reservas/listar?fecha=2025-05-11&barberoId=1
        [HttpGet("listar")]
        public async Task<IActionResult> ListarReservas(DateTime fecha, int barberoId)
        {
            try
            {
                var result = await _reservaService.ListarReservasAsync(fecha, barberoId);
                if (result.IsSuccess)
                    return Ok(result);
                else
                    return BadRequest(result);
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex);
            }
        }
    }
}
