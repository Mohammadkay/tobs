using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using static Core.Enums;

namespace SPChallengeAPI.Controllers
{
    [ApiExplorerSettings(IgnoreApi = true)]
    public class ImageController : BaseController
    {
        [AllowAnonymous]
        public IActionResult GetImage(string ImageName, int ImageType)
        {
            string ImagePath = string.Empty;

            switch (ImageType)
            {
                case (int)Core.Enums.ImagesTypes.User:
                    ImagePath = Core.Enums.ImagePath.User;
                    break;

                case (int)Core.Enums.ImagesTypes.Stade:
                    ImagePath = Core.Enums.ImagePath.Stade;
                    break;

                case (int)Core.Enums.ImagesTypes.StadeService:
                    ImagePath = Core.Enums.ImagePath.StadeService;
                    break;

                case (int)Core.Enums.ImagesTypes.Match:
                    ImagePath = Core.Enums.ImagePath.Match;
                    break;

                case (int)Core.Enums.ImagesTypes.Default:
                    ImagePath = Core.Enums.ImagePath.Default;
                    break;

                default: return BadRequest("Image Type Not Exists !");
            }

            var imagePath = Path.Combine(Directory.GetCurrentDirectory(), ImagePath+ ImageName);

            if (System.IO.File.Exists(imagePath))
            {
                var imageBytes = System.IO.File.ReadAllBytes(imagePath);
                return File(imageBytes, "image/jpeg"); // Adjust the content type based on your image type.
            }

            return NotFound(); // Image not found
        }
    }
}
