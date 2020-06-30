﻿using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DTOs
{
	public class BaseDto
	{
		public int Id { get; set; }
		public DateTime? DateCreated { get; set; }
		public DateTime? DateModified { get; set; }
		public DateTime? DeletedAt { get; set; }
	}
}
