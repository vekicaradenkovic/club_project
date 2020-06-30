using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.Exceptions;
using Application.Responses;
using Application.SearchObjects;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
	[Authorize]
	[Route("api/[controller]")]
	[ApiController]
	public class UseCasesController : ControllerBase
	{
		private readonly UseCaseExecutor _executor;
		public UseCasesController(UseCaseExecutor executor)
		{
			_executor = executor;
		}
		// GET: api/<UseCasesController>
		[HttpGet]
		public IActionResult Get(
			[FromQuery] UseCaseSearchObject search,
			[FromServices] IGetUseCasesCommand query)
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
