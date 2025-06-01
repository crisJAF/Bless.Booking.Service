using Bless.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bless.BusinessLogic.Interfaces
{
    public interface IUsuario
    {
        public Task<Response<LoginResponse>> LoginAsync(LoginRequest request);
        public Task<Response<string>> RegistrarAsync(Usuario usuario);
    }
}
