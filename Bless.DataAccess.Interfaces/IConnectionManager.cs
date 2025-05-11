using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bless.DataAccess.Interfaces
{
    public interface IConnectionManager
    {
        IDbConnection GetConnectionString(string key);
    }
}
