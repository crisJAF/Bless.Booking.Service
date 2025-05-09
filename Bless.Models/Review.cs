using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;

namespace Bless.Models
{
    public class Review
    {
        [JsonPropertyName("author_name")]
        public string AuthorName { get; set; }

        [JsonPropertyName("profile_photo_url")]
        public string ProfilePhotoUrl { get; set; } // URL de la foto del autor

        [JsonPropertyName("rating")]
        public int Rating { get; set; } // Puntuación de la reseña (estrellas)

        [JsonPropertyName("text")]
        public string Text { get; set; }

        [JsonPropertyName("time")]
        public long Time { get; set; }

        // Método para convertir el timestamp a DateTime
        public DateTime TimeAsDateTime => DateTimeOffset.FromUnixTimeSeconds(Time).DateTime;
    }

    public class PlaceDetailsResponse
    {
        [JsonPropertyName("result")]
        public Result Result { get; set; }
    }

    public class Result
    {
        [JsonPropertyName("reviews")]
        public List<Review> Reviews { get; set; }
    }
}
