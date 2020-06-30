namespace Application.DTOs
{
	public class SendEmailDto
	{
		public string Subject { get; set; }
		public string Content { get; set; }
		public string SendTo { get; set; }
	}
}
