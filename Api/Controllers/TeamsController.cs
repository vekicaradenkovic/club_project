using Application;
using Application.Commands;
using Application.Exceptions;
using Application.Responses;
using Application.SearchObjects;
using Application.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;
using System.Linq;

namespace Api.Controllers
{
	[Authorize]
	[Route("api/[controller]")]
	[ApiController]
	public class TeamsController : ControllerBase
	{
		private readonly UseCaseExecutor _executor;
		public TeamsController(UseCaseExecutor executor)
		{
			_executor = executor;
		}
		// GET: api/<TeamsController>
		[HttpGet]
		public IActionResult Get(
			[FromQuery] TeamSearchObject search,
			[FromServices] IGetTeamsCommand query)
		{
			try
			{
				var result = _executor.ExecuteQuery(query, search);
				var list = result.Items.ToList();
				list.ForEach(x => x.PhotoPath = GetFullPhotoPath(x.PhotoPath));
				result.Items = list;
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

		// GET api/<TeamsController>/5
		[HttpGet("{id}")]
		public IActionResult Get(int id, [FromServices] IGetTeamCommand query)
		{
			try
			{
				var result = _executor.ExecuteQuery(query, id);
				result.PhotoPath = GetFullPhotoPath(result.PhotoPath);
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

		// POST api/<TeamsController>/5
		[HttpPost]
		[AllowAnonymous]
		public IActionResult Post([FromForm] CreateTeamDto request, [FromServices] IAddTeamCommand command)
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

		// PUT api/<TeamsController>/5
		[HttpPut("{id}")]
		public IActionResult Put(int id, [FromForm] CreateTeamDto request, [FromServices] IUpdateTeamCommand command)
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

		// DELETE api/<TeamsController>/5
		[HttpDelete("{id}")]
		public IActionResult Delete(int id, [FromServices] IDeleteTeamCommand command)
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


		private string GetFullPhotoPath(string photoPath)
		{
			return $"{this.Request.Scheme}://{this.Request.Host}{this.Request.PathBase}/MyImages/{photoPath}";
		}
	}
}
