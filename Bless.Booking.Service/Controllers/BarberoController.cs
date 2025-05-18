using Microsoft.AspNetCore.Mvc;

namespace Bless.Booking.Service.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class BarberoController : Controller
    {
        private readonly Bless.BusinessLogic.Interfaces.IBarbero _barberoService;
        public BarberoController(Bless.BusinessLogic.Interfaces.IBarbero barberoService)
        {
            _barberoService = barberoService;
        }

        // GET: api/barbero/listar
        [HttpGet("listar")]
        public async Task<IActionResult> ListarBarberos()
        {
            try
            {
                var result = await _barberoService.ListarBarberosAsync();
                if (result.IsSuccess)
                    return Ok(result);
                else
                    return BadRequest(result);

            } catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex);
            }
        }
    }
}
