using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Application;
using Application.Commands;
using Application.Exceptions;
using Application.Responses;
using Application.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Api.Controllers
{
	[Authorize]
	[Route("api/[controller]")]
	[ApiController]
	public class UserUseCasesController : ControllerBase
	{
		private readonly UseCaseExecutor _executor;
		public UserUseCasesController(UseCaseExecutor executor)
		{
			_executor = executor;
		}
		// POST api/<UserUseCasesController>/5
		[HttpPost]
		public IActionResult Post([FromBody] CreateUserUseCaseDto request, [FromServices] IAddUseCaseToUserCommand command)
		{
			try
			{
				_executor.ExecuteCommand(command, request);
				return Ok();
			}
			catch (BadRequestException badRequest)
			{
				return BadRequest(new ExceptionResponse(badRequest.Message));
			}
			catch (ValidationException ex)
			{
				return BadRequest(new ExceptionResponse(ex.Message));
			}
			catch (UnauthorizedUseCaseException authorizeEx)
			{
				return Unauthorized(new ExceptionResponse(authorizeEx.Message));
			}
		}

		// DELETE api/<UserUseCasesController>/5
		[HttpDelete("{id}")]
		public IActionResult Delete(List<int> useCaseIds,int id, [FromServices] IDeleteUserUseCaseCommand command)
		{
			try
			{
				_executor.ExecuteDeleteMultipleCommand(command, useCaseIds, id);
				return NoContent();
			}
			catch (EntityNotFoundException ex)
			{
				return NotFound(new ExceptionResponse(ex.Message));
			}
			catch (UnauthorizedUseCaseException authorizeEx)
			{
				return Unauthorized(new ExceptionResponse(authorizeEx.Message));
			}
		}
	}
}
