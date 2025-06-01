using Bless.DataAccess.Interfaces;
using Dapper;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bless.DataAccess
{
    public class Usuario : IUsuario
    {
        private readonly IConnectionManager connectionManager;

        public Usuario(IConnectionManager connectionManager)
        {
            this.connectionManager = connectionManager;
        }

        public async Task<Models.Usuario> ObtenerUsuarioAsync(string nombreUsuario)
        {
            using var connection = connectionManager.GetConnectionString(ConnectionManager.connectionStringKey);

            var result = await connection.QueryFirstOrDefaultAsync<Models.Usuario>(
                "Usuario_ValidarLogin",
                new { NombreUsuario = nombreUsuario },
                commandType: CommandType.StoredProcedure
            );

            return result;
        }

        public async Task<int> RegistrarUsuarioAsync(Models.Usuario usuario)
        {
            using var connection = connectionManager.GetConnectionString(ConnectionManager.connectionStringKey);

            var result = await connection.ExecuteAsync(
                "Usuario_Registrar",
                new
                {
                    usuario.NombreUsuario,
                    usuario.CorreoElectronico,
                    usuario.ContrasenaHash,
                    usuario.Rol
                },
                commandType: CommandType.StoredProcedure
            );

            return result;
        }
    }
}
