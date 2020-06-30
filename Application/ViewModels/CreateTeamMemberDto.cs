using Microsoft.AspNetCore.Http;
using System;

namespace Application.ViewModels
{
	public class CreateTeamMemberDto
	{
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public DateTime DateOfBirth { get; set; }
		public bool Active { get; set; }
		public int TeamId { get; set; }
		public int TeamRoleId { get; set; }
		public int CountryId { get; set; }
		public int PositionId { get; set; }
		public IFormFile Image { get; set; }
	}
}
