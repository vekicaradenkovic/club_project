using Application.DTOs;
using Application.Email;
using System.Net;
using System.Net.Mail;

namespace Implementation.Email
{
	public class EmailSmtpSender : IEmailSender
	{
        public void Send(SendEmailDto dto)
        {
            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("aspictrs@gmail.com", "Sifra123!")
            };

            var message = new MailMessage("aspictrs@gmail.com", dto.SendTo);
            message.Subject = dto.Subject;
            message.Body = dto.Content;
            message.IsBodyHtml = true;
            smtp.Send(message);
        }
    }
}
