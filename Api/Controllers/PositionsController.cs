using Application;
using Application.Commands;
using Application.Exceptions;
using Application.Responses;
using Application.SearchObjects;
using Application.ViewModels;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.ComponentModel.DataAnnotations;

namespace Api.Controllers
{
	[Authorize]
	[Route("api/[controller]")]
	[ApiController]
	public class PositionsController : ControllerBase
	{
		private readonly UseCaseExecutor _executor;
		public PositionsController(UseCaseExecutor executor)
		{
			_executor = executor;
		}
		// GET: api/<PositionsController>
		[HttpGet]
		public IActionResult Get(
			[FromQuery] PositionSearchObject search,
			[FromServices] IGetPositionsCommand query)
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

		// GET api/<PositionsController>/5
		[HttpGet("{id}")]
		public IActionResult Get(int id, [FromServices] IGetPositionCommand query)
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

		// POST api/<PositionsController>/5
		[HttpPost]
		public IActionResult Post([FromBody] CreatePositionDto request, [FromServices] IAddPositionCommand command)
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

		// PUT api/<PositionsController>/5
		[HttpPut("{id}")]
		public IActionResult Put(int id, [FromBody] CreatePositionDto request, [FromServices] IUpdatePositionCommand command)
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

		// DELETE api/<PositionsController>/5
		[HttpDelete("{id}")]
		public IActionResult Delete(int id, [FromServices] IDeletePositionCommand command)
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
