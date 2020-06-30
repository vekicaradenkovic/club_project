using System.ComponentModel.DataAnnotations;

namespace Domain
{
	public class Position:BaseEntity
	{
		[Required]
		public string PositionName { get; set; }
	}
}
