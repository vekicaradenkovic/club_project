using Application.DTOs;
using Application.ViewModels;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Profiles
{
	public class CountryProfile : Profile
	{
        public override string ProfileName
        {
            get
            {
                return "CountryProfile";
            }
        }

        public CountryProfile()
        {
            ConfigureMappings();
        }


        /// <summary>
        /// Creates a mapping between source (Domain) and destination (ViewModel)
        /// </summary>
        private void ConfigureMappings()
        {
            CreateMap<Country, CountryDto>()
                .ForMember(u => u.Id, usr => usr.MapFrom(x => x.Id))
                .ForMember(u => u.CountryName, usr => usr.MapFrom(x => x.CountryName))
                .ForMember(u => u.DateCreated, usr => usr.MapFrom(x => x.DateCreated))
                .ForMember(u => u.DateModified, usr => usr.MapFrom(x => x.DateModified))
                .ForMember(u => u.DeletedAt, usr => usr.MapFrom(x => x.DeletedAt))
                .ReverseMap();

            CreateMap<CreateCountryDto, Country>()
                .ForMember(u => u.CountryName, usr => usr.MapFrom(x => x.CountryName));

        }
    }
}
