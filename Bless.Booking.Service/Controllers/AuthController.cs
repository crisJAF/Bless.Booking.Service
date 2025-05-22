using Microsoft.AspNetCore.Mvc;

namespace Bless.Booking.Service.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class AuthController : ControllerBase
    {
        [HttpPost("login")]
        public IActionResult Login([FromBody] LoginRequest request)
        {
            if (request.Email == "admin@bless.com" && request.Password == "admin123")
            {
                // Opcional: puedes retornar un token JWT aquí
                return Ok(new { success = true, message = "Login exitoso" });
            }

            return Unauthorized(new { success = false, message = "Credenciales inválidas" });
        }

        public class LoginRequest
        {
            public string Email { get; set; }
            public string Password { get; set; }
        }
    }
}
