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
	public class CountriesController : ControllerBase
	{
		private readonly UseCaseExecutor _executor;
		public CountriesController(UseCaseExecutor executor)
		{
			_executor = executor;
		}
		// GET: api/<CountriesController>
		[HttpGet]
		public IActionResult Get(
			[FromQuery] CountrySearchObject search,
			[FromServices] IGetCountriesCommand query)
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

		// GET api/<CountriesController>/5
		[HttpGet("{id}")]
		public IActionResult Get(int id, [FromServices] IGetCountryCommand query)
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

		// POST api/<CountriesController>/5
		[HttpPost]
		public IActionResult Post([FromBody] CreateCountryDto request, [FromServices] IAddCountryCommand command)
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

		// PUT api/<CountriesController>/5
		[HttpPut("{id}")]
		public IActionResult Put(int id, [FromBody] CreateCountryDto request, [FromServices] IUpdateCountryCommand command)
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

		// DELETE api/<CountriesController>/5
		[HttpDelete("{id}")]
		public IActionResult Delete(int id, [FromServices] IDeleteCountryCommand command)
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
