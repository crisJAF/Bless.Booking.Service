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
                return Ok(reviews ?? new List<Review>());
            }
            catch (InvalidOperationException ex)
            {
                return StatusCode(StatusCodes.Status502BadGateway, new { message = ex.Message });
            }
            catch (Exception ex)
            {
                return StatusCode(StatusCodes.Status500InternalServerError, new { message = ex.Message });
            }
        }
    }
}
