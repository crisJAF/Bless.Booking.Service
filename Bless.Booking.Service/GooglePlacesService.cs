using Microsoft.AspNetCore.Mvc.ViewEngines;
using System.Text.Json.Serialization;
using Bless.Models;

namespace Bless.Booking.Service
{
    public class GooglePlacesService
    {
        private readonly HttpClient _httpClient;
        private readonly string _apiKey;
        private readonly string _placeId;

        public GooglePlacesService(IConfiguration configuration, HttpClient httpClient)
        {
            _httpClient = httpClient;
            _apiKey = configuration["Google:ApiKey"];  // Obtiene la API Key desde appsettings.json
            _placeId = configuration["Google:PlaceId"];  // Obtiene el Place ID desde appsettings.json
        }

        public async Task<List<Review>> GetReviewsAsync()
        {
            try
            {
                // URL ajustada para incluir las reseñas con puntuaciones y fotos del autor
                var url = $"https://maps.googleapis.com/maps/api/place/details/json?place_id={_placeId}&fields=reviews&language=es&key={_apiKey}";

                var response = await _httpClient.GetFromJsonAsync<PlaceDetailsResponse>(url);

                if (response?.Result?.Reviews != null && response.Result.Reviews.Count > 0)
                {
                    foreach (var review in response.Result.Reviews)
                    {
                        // Traducir el texto de la reseña al español
                        review.Text = await TranslateTextAsync(review.Text, "es");
                    }
                    return response.Result.Reviews;
                }

                return new List<Review>();  // Si no hay reseñas, devolver una lista vacía
            }
            catch (HttpRequestException ex)
            {
                Console.WriteLine($"Error HTTP en la API de Google Places: {ex.Message}");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error inesperado en GooglePlacesService: {ex.Message}");
            }

            return new List<Review>();  // Retorna una lista vacía si hay error
        }

        private async Task<string> TranslateTextAsync(string text, string targetLanguage = "es")
        {
            try
            {
                var url = $"https://translation.googleapis.com/language/translate/v2?key={_apiKey}";
                var requestData = new
                {
                    q = text,
                    target = targetLanguage
                };

                var response = await _httpClient.PostAsJsonAsync(url, requestData);
                if (response.IsSuccessStatusCode)
                {
                    var jsonResponse = await response.Content.ReadFromJsonAsync<GoogleTranslateResponse>();
                    return jsonResponse?.Data?.Translations?[0]?.TranslatedText ?? text;
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al traducir: {ex.Message}");
            }

            return text; // Si hay un error, devolver el texto original
        }
    }

    // Clases para la respuesta de Google Translate
    public class GoogleTranslateResponse
    {
        [JsonPropertyName("data")]
        public TranslationData Data { get; set; }
    }

    public class TranslationData
    {
        [JsonPropertyName("translations")]
        public List<Translation> Translations { get; set; }
    }

    public class Translation
    {
        [JsonPropertyName("translatedText")]
        public string TranslatedText { get; set; }
    }
}
