using System.ComponentModel.DataAnnotations;
using Application;
using Application.Commands;
using Application.ViewModels;
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
	public class TeamRolesController : ControllerBase
	{
		private readonly UseCaseExecutor _executor;
		public TeamRolesController(UseCaseExecutor executor)
		{
			_executor = executor;
		}
		// GET: api/<TeamRolesController>
		[HttpGet]
		public IActionResult Get(
			[FromQuery] TeamRoleSearchObject search,
			[FromServices] IGetTeamRolesCommand query)
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

		// GET api/<TeamRolesController>/5
		[HttpGet("{id}")]
		public IActionResult Get(int id, [FromServices] IGetTeamRoleCommand query)
		{
			try
			{
				var result = _executor.ExecuteQuery(query, id);
				return Ok(result);

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

		// POST api/<TeamRolesController>/5
		[HttpPost]
		public IActionResult Post([FromBody] CreateTeamRoleDto request, [FromServices] IAddTeamRoleCommand command)
		{
			try
			{
				_executor.ExecuteCommand(command, request);
				return Ok();
			}
			catch(BadRequestException badRequest)
			{
				return BadRequest(new ExceptionResponse(badRequest.Message));
			}
			catch (ValidationException ex)
			{
				return BadRequest(new ExceptionResponse(ex.Message));
			}
			catch(UnauthorizedUseCaseException authorizeEx)
			{
				return Unauthorized(new ExceptionResponse(authorizeEx.Message));
			}
		}

		// PUT api/<TeamRolesController>/5
		[HttpPut("{id}")]
		public IActionResult Put(int id, [FromBody] CreateTeamRoleDto request, [FromServices] IUpdateTeamRoleCommand command)
		{
			try
			{
				_executor.ExecuteUpdateCommand(command, request, id);
				return Ok();
			}
			catch (BadRequestException badRequest)
			{
				return BadRequest(new ExceptionResponse(badRequest.Message));
			}
			catch (EntityNotFoundException notFound)
			{
				return NotFound(new ExceptionResponse(notFound.Message));
			}
			catch (ValidationException validationEx)
			{
				return BadRequest(new ExceptionResponse(validationEx.Message));
			}
			catch (UnauthorizedUseCaseException authorizeEx)
			{
				return Unauthorized(new ExceptionResponse(authorizeEx.Message));
			}
		}

		// DELETE api/<TeamRolesController>/5
		[HttpDelete("{id}")]
		public IActionResult Delete(int id, [FromServices] IDeleteTeamRoleCommand command)
		{
			try
			{
				_executor.ExecuteCommand(command, id);
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
