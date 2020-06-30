using System;
using System.IO;

namespace Application.Helpers
{
	public static class CreatePhotoPathForImage
	{
		public static string GeneratePhotoPath(string photoPath)
		{
			var guid = Guid.NewGuid();
			var extension = Path.GetExtension(photoPath);

			return guid + extension;
		}
	}
}
