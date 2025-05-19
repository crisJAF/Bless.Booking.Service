using Bless.BusinessLogic.Interfaces;
using Bless.Models;

namespace Bless.BusinessLogic
{
    public class Barbero : IBarbero
    {
        private readonly DataAccess.Interfaces.IBarbero _barbero;
        public Barbero(DataAccess.Interfaces.IBarbero barbero)
        {
            this._barbero = barbero;
        }
        public async Task<Response<List<Models.Barbero>>> ListarBarberosAsync()
        {
            return await _barbero.ListarBarberosAsync();
        }
    }
}
