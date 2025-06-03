using Bless.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bless.DataAccess.Interfaces
{
    public interface IUsuario
    {
        public Task<Usuario> ObtenerUsuarioAsync(string nombreUsuario);
        public Task<int> RegistrarUsuarioAsync(Usuario usuario);
    }
}
