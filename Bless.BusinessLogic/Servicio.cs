using Bless.BusinessLogic.Interfaces;
using Bless.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bless.BusinessLogic
{
    public class Servicio : IServicio
    {
        private readonly Bless.DataAccess.Interfaces.IServicio servicio;
        public Servicio(Bless.DataAccess.Interfaces.IServicio servicio)
        {
            this.servicio = servicio;
        }
        public async Task<Response<List<Models.Servicio>>> ListarServiciosAsync()
        {
            return await servicio.ListarServiciosAsync();
        }
    }
}
