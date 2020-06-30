using Microsoft.AspNetCore.Http;

namespace Application.ViewModels
{
	public class CreateTeamDto
	{
		public string Name { get; set; }
		public IFormFile Image { get; set; }
		public string Description { get; set; }
	}
}
