using Core.Interfaces;
using System;
using System.IO;
using System.Reflection;
using System.Threading.Tasks;
using static Core.Enums;

namespace Core.Shared
{
    public class ImageHandler
    {
        private static string GenerateName()
        {
            string token = Guid.NewGuid().ToString();
            byte[] plainTextBytes = System.Text.Encoding.UTF8.GetBytes(token);
            return Convert.ToBase64String(plainTextBytes);
        }

        private static bool IsBase64String(string base64)
        {
            Span<byte> buffer = new Span<byte>(new byte[base64.Length]);
            return Convert.TryFromBase64String(base64, buffer, out _);
        }

        public static string HandleImages(string imageBase64, string imageName, string? oldImageName, ImagesTypes types, ref string errorMessage)
        {
            string imageFullName = string.Empty;
            string writingPath = GetImageWritePath(types, ref errorMessage);

            if (!string.IsNullOrEmpty(errorMessage))
                return string.Empty;

            if (!string.IsNullOrEmpty(oldImageName) && IsBase64String(imageBase64))
            {
                DeleteImage(oldImageName, writingPath, ref errorMessage);

                if (!string.IsNullOrEmpty(errorMessage))
                    return string.Empty;
            }

            imageFullName = SaveImage(imageBase64, imageName, writingPath, ref errorMessage);

            return imageFullName;
        }

        public static string SaveImage(string? imageBase64, string? imageName, string writingPath, ref string errorMessage)
        {
            try
            {
                string extension = string.Empty;
                string randomName = string.Empty;

                if (string.IsNullOrEmpty(imageBase64) || string.IsNullOrEmpty(imageName) || imageName.Split(".").Length <= 0)
                {
                    errorMessage = "Invalid image or name format!";
                    return string.Empty;
                }

                if (!IsBase64String(imageBase64))
                {
                    errorMessage = "Image not valid!";
                    return string.Empty;
                }

                if (!Directory.Exists(writingPath))
                    Directory.CreateDirectory(writingPath);

                byte[] imageBytes = Convert.FromBase64String(imageBase64);

                extension = "." + imageName.Split(".")[1];
                randomName = GenerateName() + extension;

                writingPath += randomName;

                File.WriteAllBytes(writingPath, imageBytes);

                return randomName;
            }
            catch (Exception ex)
            {
                errorMessage = ex.Message;
            }

            return string.Empty;
        }

        public static string LoadImage(string imageName, ImagesTypes types, bool loadAsBase64, ref string errorMessage)
        {
            try
            {
                string writingPath = GetImageWritePath(types, ref errorMessage);
                string base64Image = string.Empty;

                if (string.IsNullOrEmpty(imageName) || imageName.Split(".").Length <= 0)
                {
                    errorMessage += "Image name in incorrect format!";
                    return string.Empty;
                }

                writingPath += imageName;

                if (File.Exists(writingPath))
                {
                    if (loadAsBase64)
                    {
                        byte[] byteFile = File.ReadAllBytes(writingPath);
                        base64Image = Convert.ToBase64String(byteFile);
                    }
                    else
                    {
                        return $"{{BaseUrl}}/api/Image?ImageName={imageName}&ImageType={types.GetHashCode()}";
                    }
                }
                else
                {
                    errorMessage += "Image Not Exists!";
                }

                return base64Image;
            }
            catch (Exception ex)
            {
                errorMessage += ex.Message;
            }

            return string.Empty;
        }

        public static bool DeleteImage(string imageName, string writingPath, ref string errorMessage)
        {
            try
            {
                string imagePath = Path.Combine(writingPath, imageName);
                errorMessage = string.Empty;

                if (File.Exists(imagePath))
                    File.Delete(imagePath);
            }
            catch (Exception ex)
            {
                errorMessage = $"Message: {ex.Message} | StackTrace: {ex.StackTrace}";
            }

            return string.IsNullOrEmpty(errorMessage);
        }

        private static string GetImageWritePath(ImagesTypes types, ref string errorMessage)
        {
            string configPath = string.Empty;
            errorMessage = string.Empty;

            switch (types)
            {
                case ImagesTypes.User:
                    configPath = Path.Combine(Directory.GetCurrentDirectory(), ImagePath.User);
                    break;

                case ImagesTypes.Stade:
                    configPath = Path.Combine(Directory.GetCurrentDirectory(), ImagePath.Stade);
                    break;

                case ImagesTypes.StadeService:
                    configPath = Path.Combine(Directory.GetCurrentDirectory(), ImagePath.StadeService);
                    break;

                case ImagesTypes.Match:
                    configPath = Path.Combine(Directory.GetCurrentDirectory(), ImagePath.Match);
                    break;

                default:
                    errorMessage = "Invalid Image Type!";
                    return string.Empty;
            }

            return configPath;
        }

        public static async Task<T> HandleImage<T>(T entity, string? imageBase64, string? imageName, ImagesTypes ImageType) where T : IImageEntity
        {
            if (!string.IsNullOrEmpty(imageName) && !string.IsNullOrEmpty(imageBase64) && !imageBase64.ToLower().Contains("baseurl"))
            {
                string err = string.Empty;

                PropertyInfo imageNameProperty = typeof(T).GetProperty("ImageName");
                if (imageNameProperty != null)
                {
                    imageNameProperty.SetValue(entity, HandleImages(imageBase64, imageName, imageNameProperty.GetValue(entity)?.ToString(), ImageType, ref err));
                }

                if (string.IsNullOrEmpty(err))
                {
                    PropertyInfo imageProperty = typeof(T).GetProperty("Image");
                    if (imageProperty != null)
                    {
                        imageProperty.SetValue(entity, LoadImage(imageNameProperty.GetValue(entity)?.ToString(), ImageType, false, ref err));
                    }
                }
            }
            return entity;
        }
    }
}
