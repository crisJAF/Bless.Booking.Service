using Bless.BusinessLogic;
using Microsoft.AspNetCore.Mvc;

namespace Bless.Booking.Service.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class NotificacionesController : Controller
    {
        private readonly NotificacionService _notificacionService;

        public NotificacionesController(NotificacionService notificacionService)
        {
            _notificacionService = notificacionService;
        }

        [HttpPost("enviarNotificacion")]
        public async Task<IActionResult> EnviarNotificacion([FromQuery] string message)
        {
            await _notificacionService.EnviarNotificacionAsync(message);

            return Ok();
        }
    }
}
