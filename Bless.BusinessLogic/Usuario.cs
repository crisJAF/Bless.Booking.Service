using Bless.DataAccess.Interfaces;
using Bless.Models;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;


namespace Bless.BusinessLogic
{
    public class Usuario : Bless.BusinessLogic.Interfaces.IUsuario
    {
        private readonly IUsuario _usuario;
        private readonly IConfiguration configuration;

        public Usuario(IUsuario usuario, IConfiguration configuration)
        {
            this._usuario = usuario;
            this.configuration = configuration;
        }

        public async Task<Response<LoginResponse>> LoginAsync(LoginRequest request)
        {
            var usuario = await _usuario.ObtenerUsuarioAsync(request.NombreUsuario);
            if (usuario == null || !BCrypt.Net.BCrypt.Verify(request.Contrasena, usuario.ContrasenaHash))
            {
                return new Response<LoginResponse> { IsSuccess = false, Message = "Credenciales incorrectas." };
            }

            var token = GenerarToken(usuario);
            return new Response<LoginResponse>
            {
                IsSuccess = true,
                Message = "Login exitoso.",
                Content = new LoginResponse
                {
                    Token = token
                }
            };
        }

        public async Task<Response<string>> RegistrarAsync(Models.Usuario usuario)
        {
            usuario.ContrasenaHash = BCrypt.Net.BCrypt.HashPassword(usuario.ContrasenaHash);
    
            var restul = await _usuario.RegistrarUsuarioAsync(usuario);

            return new Response<string> { IsSuccess = true, Message = "Usuario registrado correctamente." };
 
        }

        private string GenerarToken(Models.Usuario usuario)
        {
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(configuration["Jwt:Key"]));
            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var claims = new[]
            {
            new Claim(ClaimTypes.Name, usuario.NombreUsuario),
            new Claim(ClaimTypes.Role, usuario.Rol ?? "Usuario")
        };

            var token = new JwtSecurityToken(
                issuer: configuration["Jwt:Issuer"],
                audience: configuration["Jwt:Audience"],
                claims: claims,
                expires: DateTime.UtcNow.AddHours(2),
                signingCredentials: credentials
            );

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
