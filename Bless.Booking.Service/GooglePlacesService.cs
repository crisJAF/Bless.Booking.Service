using Bless.Models;
using Microsoft.Extensions.Caching.Memory;

namespace Bless.Booking.Service
{
    public class GooglePlacesService
    {
        private const int DefaultReviewsCacheMinutes = 720;
        private const string ReviewsCacheKey = "GooglePlacesService:Reviews";

        private readonly HttpClient _httpClient;
        private readonly IMemoryCache _cache;
        private readonly ILogger<GooglePlacesService> _logger;
        private readonly string _apiKey;
        private readonly string _placeId;
        private readonly TimeSpan _reviewsCacheDuration;

        public GooglePlacesService(
            IConfiguration configuration,
            HttpClient httpClient,
            IMemoryCache cache,
            ILogger<GooglePlacesService> logger)
        {
            _httpClient = httpClient;
            _cache = cache;
            _logger = logger;
            _apiKey = configuration["Google:ApiKey"] ?? string.Empty;
            _placeId = configuration["Google:PlaceId"] ?? string.Empty;

            var cacheMinutes = configuration.GetValue<int?>("Google:ReviewsCacheMinutes")
                ?? DefaultReviewsCacheMinutes;
            _reviewsCacheDuration = TimeSpan.FromMinutes(Math.Max(1, cacheMinutes));
        }

        public async Task<List<Review>> GetReviewsAsync()
        {
            if (string.IsNullOrWhiteSpace(_apiKey) || string.IsNullOrWhiteSpace(_placeId))
            {
                throw new InvalidOperationException("La configuracion de Google Places esta incompleta.");
            }

            if (_cache.TryGetValue(ReviewsCacheKey, out List<Review>? cachedReviews))
            {
                _logger.LogInformation("Google Places reviews obtenidas desde cache.");
                return cachedReviews ?? new List<Review>();
            }

            var url =
                "https://maps.googleapis.com/maps/api/place/details/json" +
                $"?place_id={Uri.EscapeDataString(_placeId)}" +
                "&fields=name,place_id,rating,user_ratings_total,reviews" +
                "&language=es" +
                $"&key={Uri.EscapeDataString(_apiKey)}";

            var response = await _httpClient.GetFromJsonAsync<PlaceDetailsResponse>(url);

            if (response == null)
            {
                throw new InvalidOperationException("Google Places no devolvio una respuesta valida.");
            }

            if (!string.Equals(response.Status, "OK", StringComparison.OrdinalIgnoreCase)
                && !string.Equals(response.Status, "ZERO_RESULTS", StringComparison.OrdinalIgnoreCase))
            {
                _logger.LogWarning(
                    "Google Places Details fallo con status {Status}: {ErrorMessage}",
                    response.Status,
                    response.ErrorMessage);

                throw new InvalidOperationException(GetGooglePlacesErrorMessage(response));
            }

            var reviews = response.Result?.Reviews ?? new List<Review>();
            _cache.Set(ReviewsCacheKey, reviews, _reviewsCacheDuration);
            _logger.LogInformation(
                "Google Places reviews obtenidas desde API y cacheadas por {CacheMinutes} minutos.",
                _reviewsCacheDuration.TotalMinutes);

            return reviews;
        }

        private static string GetGooglePlacesErrorMessage(PlaceDetailsResponse response)
        {
            if (!string.IsNullOrWhiteSpace(response.ErrorMessage))
            {
                return response.ErrorMessage;
            }

            return response.Status switch
            {
                "REQUEST_DENIED" => "La solicitud a Google Places fue rechazada. Revisa billing, API habilitada y restricciones de la API key.",
                "INVALID_REQUEST" => "La solicitud a Google Places es invalida. Revisa el PlaceId configurado.",
                "NOT_FOUND" => "Google Places no encontro el negocio con el PlaceId configurado.",
                _ => $"Google Places respondio con estado {response.Status ?? "desconocido"}."
            };
        }
    }
}
