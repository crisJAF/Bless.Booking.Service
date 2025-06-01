using Microsoft.AspNetCore.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Bless.BusinessLogic
{
    public class NotificacionService
    {
        private readonly IHubContext<NotificacionHub> _hubContext;

        public NotificacionService(IHubContext<NotificacionHub> hubContext)
        {
            _hubContext = hubContext;
        }

        public async Task EnviarNotificacionAsync(string mensaje)
        {
            await _hubContext.Clients.All.SendAsync("RecibirNotificacion", mensaje);
        }
    }
}
