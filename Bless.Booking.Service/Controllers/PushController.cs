using Microsoft.AspNetCore.Mvc;
using System.Text.Json;
using WebPush;

[ApiController]
[Route("api/push")]
public class PushController : ControllerBase
{
    private static List<PushSubscription> _subscriptions = new();

    [HttpPost("subscribe")]
    public IActionResult Subscribe([FromBody] PushSubscription subscription)
    {
        _subscriptions.Add(subscription);
        return Ok();
    }

    [HttpPost("send")]
    public IActionResult SendNotification()
    {
        var vapidDetails = new VapidDetails(
            "",
            "",
            "");

        var webPushClient = new WebPushClient();
        foreach (var sub in _subscriptions)
        {
            var payload = JsonSerializer.Serialize(new
            {
                title = "¡Hola, tienes una nueva reserva!",
                message = "Esta es tu notificación en el teléfono."
            });

            try
            {
                webPushClient.SendNotification(sub, payload, vapidDetails);
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error al enviar: " + ex.Message);
            }
        }

        return Ok();
    }
}
