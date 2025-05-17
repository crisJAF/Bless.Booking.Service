using Microsoft.AspNetCore.Mvc;

namespace Bless.Booking.Service.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class ServicioController : Controller
    {
        private readonly Bless.BusinessLogic.Interfaces.IServicio _servicioService;
        public ServicioController(Bless.BusinessLogic.Interfaces.IServicio servicioService)
        {
            _servicioService = servicioService;
        }
        // GET: api/servicio/listar
        [HttpGet("listar")]
        public async Task<IActionResult> ListarServicios()
        {
            var result = await _servicioService.ListarServiciosAsync();
            if (result.IsSuccess)
                return Ok(result);
            else
                return BadRequest(result);
        }
    }
}
