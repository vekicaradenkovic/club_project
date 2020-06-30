using Application.Interfaces;
using System;
using System.Collections.Generic;

namespace Application.DTOs
{
	public class ReadUserDto : BaseDto,IApplicationActor
	{
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public bool IsActive { get; set; }
		public string Email { get; set; }
		public string Username { get; set; }
		public string Password { get; set; }

		public int Id { get; set; }

		public IEnumerable<int> AllowedUseCases { get; set; }
		public DateTime? DateCreated { get; set ; }
		public DateTime? DateModified { get; set ; }
		public DateTime? DeletedAt { get; set; }
	}
}
