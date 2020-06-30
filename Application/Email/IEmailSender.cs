
using Application.DTOs;

namespace Application.Email
{
	public interface IEmailSender
	{
		void Send(SendEmailDto dto);
	}
}
