using Bless.DataAccess.Interfaces;
using Bless.Models;
using Dapper;
using System.Data;

namespace Bless.DataAccess
{
    public class Barbero : IBarbero
    {
        private readonly IConnectionManager connectionManager;
        public Barbero(IConnectionManager connectionManager)
        {
            this.connectionManager = connectionManager;
        }

        public async Task<Models.Response<List<Models.Barbero>>> ListarBarberosAsync()
        {
            using var connection = connectionManager.GetConnectionString(ConnectionManager.connectionStringKey);
            var result = await connection.QueryAsync<Models.Barbero>(
                "sp_Barbero_Listar",
                commandType: CommandType.StoredProcedure
            );

            return new Response<List<Models.Barbero>> { Content = result.ToList(), IsSuccess = true, Message = "Barberos encontrados correctamente." };
        }
    }
}
