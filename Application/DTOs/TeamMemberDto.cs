using System;

namespace Application.DTOs
{
	public class TeamMemberDto : BaseDto
	{
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public DateTime DateOfBirth { get; set; }
		public bool Active { get; set; }
		public string TeamName { get; set; }
		public string RoleName { get; set; }
		public string Country { get; set; }
		public string Position { get; set; }
		public string PhotoPath { get; set; }
	}
}
