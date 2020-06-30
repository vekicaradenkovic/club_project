using Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DTOs
{
	public class JwtUserData : IApplicationActor
	{
		public int Id { get; set; }
		public string Username { get; set; }
		public IEnumerable<int> AllowedUseCases { get; set; }
	}
}
