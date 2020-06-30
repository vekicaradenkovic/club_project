using Application.DTOs;
using Application.Interfaces;
using System;

namespace Application.Exceptions
{
    public class UnauthorizedUseCaseException : Exception
    {
        public UnauthorizedUseCaseException(IUseCase useCase, IApplicationActor actor)
            : base($"Actor with an id of {actor.Id} - {actor.Username} tried to execute {useCase.Name}.")
        {

        }
    }
}
