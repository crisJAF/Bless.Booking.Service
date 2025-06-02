namespace Bless.Models
{
    public class Reserva
    {
        public int ReservaId { get; set; }
        public string NombreCliente { get; set; } = string.Empty;
        public string NombreBarbero { get; set; } = string.Empty;
        public string NombreServicio { get; set; } = string.Empty;
        public DateTime Fecha { get; set; }
        public TimeSpan Hora { get; set; }
        public string Estado { get; set; } = string.Empty;
    }
}
