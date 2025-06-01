using Bless.BusinessLogic;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Bless.Booking.Service.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class NotificacionesController : Controller
    {
        private readonly NotificacionService _notificacionService;

        public NotificacionService NotificacionService => _notificacionService;

        [HttpPost("enviarNotificacion")]
        public async Task<IActionResult> EnviarNotificacion(string message)
        {
            //await NotificacionService.EnviarNotificacionAsync(message);

            return Ok();
        }
    }
}
