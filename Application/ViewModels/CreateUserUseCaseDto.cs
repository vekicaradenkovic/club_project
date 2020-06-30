using System;
using System.Collections.Generic;
using System.Text;

namespace Application.ViewModels
{
	public class CreateUserUseCaseDto
	{
		public int UserId { get; set; }
		public List<int> UseCaseId { get; set; }
	}
}
