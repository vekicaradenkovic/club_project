using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DTOs
{
	public class TeamDto : BaseDto
	{
		public string Name { get; set; }
		public string PhotoPath { get; set; }
		public string Description { get; set; }
	}
}
