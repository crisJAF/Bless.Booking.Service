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

        public ReservasController(IReserva reservaService)
        {
            this._reservaService = reservaService;
        }

        // POST: api/reservas/guardar
        [HttpPost("guardar")]
        public async Task<IActionResult> GuardarReserva([FromBody] ReservaRequest request)
        {
            try
            {
                var result = await _reservaService.GuardarReservaAsync(request);
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
    }
}
