using Application.DTOs;
using Application.Helpers;
using Application.ViewModels;
using AutoMapper;
using Domain;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Application.Profiles
{
	public class TeamProfile : Profile
	{
        public override string ProfileName
        {
            get
            {
                return "TeamProfile";
            }
        }

        public TeamProfile()
        {
            ConfigureMappings();
        }


        /// <summary>
        /// Creates a mapping between source (Domain) and destination (ViewModel)
        /// </summary>
        private void ConfigureMappings()
        {
            // Citanje iz baze
            CreateMap<Team, TeamDto>()
                .ForMember(u => u.Id, usr => usr.MapFrom(x => x.Id))
                .ForMember(u => u.Name, usr => usr.MapFrom(x => x.TeamName))
                .ForMember(u => u.PhotoPath, usr => usr.MapFrom(x => x.PhotoPath))
                .ForMember(u => u.Description, usr => usr.MapFrom(x => x.Description))
                .ForMember(u => u.DateCreated, usr => usr.MapFrom(x => x.DateCreated))
                .ForMember(u => u.DateModified, usr => usr.MapFrom(x => x.DateModified))
                .ForMember(u => u.DeletedAt, usr => usr.MapFrom(x => x.DeletedAt))
                .ReverseMap();

            CreateMap<CreateTeamDto, Team>()
                .ForMember(u => u.TeamName, usr => usr.MapFrom(x => x.Name))
                .ForMember(u => u.PhotoPath, usr => usr.MapFrom(x => CreatePhotoPathForImage.GeneratePhotoPath(x.Image.FileName)))
                .ForMember(u => u.Description, usr => usr.MapFrom(x => x.Description))
                .ReverseMap();
        }
    }
}
