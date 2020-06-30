using System;
using System.Collections.Generic;
using System.Text;

namespace Application.SearchObjects
{
	public class AuditLogSearchObject : BaseSearchQuery
	{
		public int UserId { get; set; }
		public DateTime? StartDate { get; set; }
		public DateTime? EndDate { get; set; }
	}
}
