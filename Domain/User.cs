using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace Domain
{
	public class User : BaseEntity
	{
		[Required]
		public string FirstName { get; set; }
		[Required]
		public string LastName { get; set; }
		[Required]
		public string Username { get; set; }
		[Required]
		public string Password { get; set; }
		public string Email { get; set; }
		public bool IsActive { get; set; }
		public virtual ICollection<UserUseCase> UserUserCases { get; set; }
	}
}
