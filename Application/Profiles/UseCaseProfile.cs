using Application.DTOs;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Profiles
{
	public class UseCaseProfile : Profile
	{
        public override string ProfileName
        {
            get
            {
                return "UseCaseProfile";
            }
        }

        public UseCaseProfile()
        {
            ConfigureMappings();
        }


        /// <summary>
        /// Creates a mapping between source (Domain) and destination (ViewModel)
        /// </summary>
        private void ConfigureMappings()
        {
            CreateMap<UseCase, UseCaseDto>()
                .ForMember(u => u.Id, usr => usr.MapFrom(x => x.Id))
                .ForMember(u => u.UseCase, usr => usr.MapFrom(x => x.Name))
                .ForMember(u => u.DateCreated, usr => usr.MapFrom(x => x.DateCreated))
                .ForMember(u => u.DateModified, usr => usr.MapFrom(x => x.DateModified))
                .ForMember(u => u.DeletedAt, usr => usr.MapFrom(x => x.DeletedAt))
                .ReverseMap();

        }
    }
}
