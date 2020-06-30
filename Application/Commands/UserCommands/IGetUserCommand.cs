using Application.DTOs;
using Application.Interfaces;
using System;
using System.Collections.Generic;
using System.Text;
using System.Windows.Input;

namespace Application.Commands
{
	public interface IGetUserCommand : IQuery<int,ReadUserDto>
	{
	}
}
