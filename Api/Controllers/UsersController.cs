using Application;
using Application.Commands;
using Application.ViewModels;
using Application.Exceptions;
using Application.Responses;
using Application.SearchObjects;
using FluentValidation;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Api.Controllers
{
	[Authorize]
	[Route("api/[controller]")]
	[ApiController]
	public class UsersController : ControllerBase
	{
		private readonly UseCaseExecutor _executor;
		public UsersController(UseCaseExecutor executor)
		{
			_executor = executor;
		}
		// GET: api/<UsersController>
		[HttpGet]
		public IActionResult Get(
			[FromQuery]UserSearchObject search,
			[FromServices]IGetUsersCommand query)
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

		// GET api/<UsersController>/5
		[HttpGet("{id}")]
		public IActionResult Get(int id,[FromServices] IGetUserCommand query)
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

		// POST api/<UsersController>
		[HttpPost]
		[AllowAnonymous]
		public IActionResult Post(
			[FromBody] CreateUserDto dto,
			[FromServices] IAddUserCommand command)
		{
			try
			{
				_executor.ExecuteCommand(command, dto);
				return Ok();

			}
			catch(ValidationException ex)
			{
				return BadRequest(new ExceptionResponse(ex.Message));
			}
			catch (UnauthorizedUseCaseException authorizeEx)
			{
				return Unauthorized(new ExceptionResponse(authorizeEx.Message));
			}
		}

		// PUT api/<UsersController>/5
		[HttpPut("{id}")]
		public IActionResult Put(int id, [FromBody] UpdateUserDto request, [FromServices] IUpdateUserCommand command)
		{
			try
			{
				_executor.ExecuteUpdateCommand(command, request, id);
				return Ok();
			}
			catch(BadRequestException badRequest)
			{
				return BadRequest(new ExceptionResponse(badRequest.Message));
			}
			catch(EntityNotFoundException notFound) 
			{
				return NotFound(new ExceptionResponse(notFound.Message));
			}
			catch(ValidationException validationEx)
			{
				return BadRequest(new ExceptionResponse(validationEx.Message));
			}
			catch (UnauthorizedUseCaseException authorizeEx)
			{
				return Unauthorized(new ExceptionResponse(authorizeEx.Message));
			}
		}

		// DELETE api/<UsersController>/5
		[HttpDelete("{id}")]
		public IActionResult Delete(int id,[FromServices] IDeleteUserComamnd command)
		{
			try
			{
				_executor.ExecuteCommand(command, id);
				return NoContent();
			}
			catch(EntityNotFoundException ex)
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
