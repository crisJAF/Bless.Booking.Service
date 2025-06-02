using Bless.BusinessLogic.Interfaces;
using Bless.Models;
using Microsoft.AspNetCore.Mvc;

namespace Bless.Booking.Service.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        private readonly IUsuario _usuario;

        public AuthController(IUsuario usuario)
        {
            this._usuario = usuario;
        }

        [HttpPost("login")]
        public async Task<IActionResult> Login([FromBody] LoginRequest request)
        {
            try
            {
                var result = await _usuario.LoginAsync(request);
                return result.IsSuccess ? Ok(result.Content) : Unauthorized(result.Message);

            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }

        [HttpPost("register")]
        public async Task<IActionResult> Register([FromBody] Usuario nuevoUsuario)
        {
            try
            {
                var result = await _usuario.RegistrarAsync(nuevoUsuario);
                return result.IsSuccess ? Ok(result.Message) : BadRequest(result.Message);

            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, ex.Message);
            }
        }
    }
}
