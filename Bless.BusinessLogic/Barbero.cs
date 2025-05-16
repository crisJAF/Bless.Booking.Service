using Bless.BusinessLogic.Interfaces;
using Bless.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bless.BusinessLogic
{
    public class Barbero : IBarbero
    {
        private readonly Bless.DataAccess.Interfaces.IBarbero barbero;
        public Barbero(Bless.DataAccess.Interfaces.IBarbero barbero)
        {
            this.barbero = barbero;
        }
        public async Task<Response<List<Models.Barbero>>> ListarBarberosAsync()
        {
            return await barbero.ListarBarberosAsync();
        }
    }
}
