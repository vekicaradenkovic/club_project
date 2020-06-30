using System;
using System.Collections.Generic;
using System.Text;

namespace Domain
{
	public class Team:BaseEntity
	{
		public string TeamName { get; set; }
		public string PhotoPath { get; set; }
		public string Description { get; set; }
	}
}
