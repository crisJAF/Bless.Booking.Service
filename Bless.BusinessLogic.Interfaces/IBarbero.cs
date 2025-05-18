using Bless.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bless.BusinessLogic.Interfaces
{
    public interface IBarbero
    {
        Task<Response<List<Barbero>>> ListarBarberosAsync();

    }
}
