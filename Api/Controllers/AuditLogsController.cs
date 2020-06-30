using Application;
using Application.Commands;
using Application.Exceptions;
using Application.Responses;
using Application.SearchObjects;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
	[Authorize]
	[Route("api/[controller]")]
	[ApiController]
	public class AuditLogsController : ControllerBase
	{
		private readonly UseCaseExecutor _executor;
		public AuditLogsController(UseCaseExecutor executor)
		{
			_executor = executor;
		}
		// GET: api/<AuditLogsController>
		[HttpGet]
		public IActionResult Get(
			[FromQuery] AuditLogSearchObject search,
			[FromServices] IGetAuditLogsCommand query)
		{
			try
			{
				var result = _executor.ExecuteQuery(query, search);
				return Ok(result);
			}
			catch (BadRequestException ex)
			{
				return BadRequest(new ExceptionResponse(ex.Message));
			}
			catch (UnauthorizedUseCaseException authorizeEx)
			{
				return Unauthorized(new ExceptionResponse(authorizeEx.Message));
			}
		}
	}
}
