using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bless.Models
{
    public class Usuario
    {
        public int Id { get; set; }
        public string NombreUsuario { get; set; }
        public string CorreoElectronico { get; set; }
        public string ContrasenaHash { get; set; }
        public string Rol { get; set; }
        public DateTime FechaCreacion { get; set; }
    }

}
