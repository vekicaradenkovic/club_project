using System;

namespace Domain
{
	public class TeamMember:BaseEntity
	{
		public string FirstName{ get; set; }
		public string LastName { get; set; }
		public DateTime DateOfBirth { get; set; }
		public bool Active { get; set; }
		public int TeamId { get; set; }
		public int TeamRoleId { get; set; }
		public int CountryId { get; set; }
		public string PhotoPath { get; set; }
		public int? PositionId { get; set; }

		public virtual Team Team { get; set; }
		public virtual TeamRole TeamRole { get; set; }
		public virtual Country Country { get; set; }
		public virtual Position Position { get; set; }
	}
}
