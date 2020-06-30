
using System;

namespace Application.DTOs
{
	public class AuditLogDto : BaseDto
	{
		public DateTime Date { get; set; }
		public string UseCaseName { get; set; }
		public string Data { get; set; }
		public string Username { get; set; }
	}
}
