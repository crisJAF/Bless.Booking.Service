using Microsoft.AspNetCore.Mvc;

namespace Bless.Booking.Service.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ServicioController : Controller
    {
        private readonly BusinessLogic.Interfaces.IServicio _servicioService;
        public ServicioController(BusinessLogic.Interfaces.IServicio servicioService)
        {
            _servicioService = servicioService;
        }

        // GET: api/servicio/listar
        [HttpGet("listar")]
        public async Task<IActionResult> ListarServicios()
        {

            try
            {
                var result = await _servicioService.ListarServiciosAsync();
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
