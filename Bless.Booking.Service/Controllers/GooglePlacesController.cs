using Bless.Models;
using Microsoft.AspNetCore.Mvc;

namespace Bless.Booking.Service.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GooglePlacesController : ControllerBase
    {
        private readonly GooglePlacesService _googlePlacesService;

        public GooglePlacesController(GooglePlacesService googlePlacesService)
        {
            _googlePlacesService = googlePlacesService;
        }

        // Endpoint para obtener los reviews
        [HttpGet("reviews")]
        public async Task<ActionResult<List<Review>>> GetReviews()
        {
            try
            {
                var reviews = await _googlePlacesService.GetReviewsAsync();

                if (reviews == null || reviews.Count == 0)
                {
                    return Ok(new { message = "No hay reseñas disponibles en este momento." });
                }

                return Ok(reviews);
            }
            catch (Exception ex)
            {
                return StatusCode(500, ex.Message);
            }
        }
    }
}
