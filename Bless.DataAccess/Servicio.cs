using Bless.DataAccess.Interfaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using Bless.Models;

namespace Bless.DataAccess
{
    public class Servicio : IServicio
    {
        private readonly IConnectionManager connectionManager;
        public Servicio(IConnectionManager connectionManager)
        {
            this.connectionManager = connectionManager;
        }
        public async Task<Models.Response<List<Models.Servicio>>> ListarServiciosAsync()
        {
            using var connection = connectionManager.GetConnectionString(ConnectionManager.connectionStringKey);
            var result = await connection.QueryAsync<Models.Servicio>(
                "sp_ServicioListar",
                commandType: CommandType.StoredProcedure
            );
            return new Response<List<Models.Servicio>> { Content = result.ToList(), IsSuccess = true, Message = "Servicios encontrados correctamente." };
        }
    }
}
