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
	public class TeamMemberProfile : Profile
	{
        public override string ProfileName
        {
            get
            {
                return "TeamMemberProfile";
            }
        }

        public TeamMemberProfile()
        {
            ConfigureMappings();
        }


        /// <summary>
        /// Creates a mapping between source (Domain) and destination (ViewModel)
        /// </summary>
        private void ConfigureMappings()
        {
            // Citanje iz baze
            CreateMap<TeamMember, TeamMemberDto>()
                .ForMember(u => u.Id, teamMember => teamMember.MapFrom(x => x.Id))
                .ForMember(u => u.FirstName, teamMember => teamMember.MapFrom(x => x.FirstName))
                .ForMember(u => u.LastName, teamMember => teamMember.MapFrom(x => x.LastName))
                .ForMember(u => u.PhotoPath, teamMember => teamMember.MapFrom(x => x.PhotoPath))
                .ForMember(u => u.DateOfBirth, teamMember => teamMember.MapFrom(x => x.DateOfBirth))
                .ForMember(u => u.Active, teamMember => teamMember.MapFrom(x => x.Active))
                .ForMember(u => u.Country, teamMember => teamMember.MapFrom(x => x.Country.CountryName))
                .ForMember(u => u.Position, teamMember => teamMember.MapFrom(x => x.Position.PositionName))
                .ForMember(u => u.RoleName, teamMember => teamMember.MapFrom(x => x.TeamRole.RoleName))
                .ForMember(u => u.TeamName, teamMember => teamMember.MapFrom(x => x.Team.TeamName))
                .ForMember(u => u.DateCreated, teamMember => teamMember.MapFrom(x => x.DateCreated))
                .ForMember(u => u.DateModified, teamMember => teamMember.MapFrom(x => x.DateModified))
                .ForMember(u => u.DeletedAt, teamMember => teamMember.MapFrom(x => x.DeletedAt))
                .ReverseMap();

            CreateMap<CreateTeamMemberDto, TeamMember>()
                .ForMember(x => x.FirstName, teamMember => teamMember.MapFrom(x => x.FirstName))
                .ForMember(x => x.LastName, teamMember => teamMember.MapFrom(x => x.LastName))
                .ForMember(x => x.PhotoPath, teamMember => teamMember.MapFrom(x => CreatePhotoPathForImage.GeneratePhotoPath(x.Image.FileName)))
                .ForMember(x => x.DateOfBirth, teamMember => teamMember.MapFrom(x => x.DateOfBirth))
                .ForMember(x => x.Active, teamMember => teamMember.MapFrom(x => x.Active))
                .ForMember(x => x.CountryId, teamMember => teamMember.MapFrom(x => x.CountryId))
                .ForMember(x => x.PositionId, teamMember => teamMember.MapFrom(x => x.PositionId))
                .ForMember(x => x.TeamRoleId, teamMember => teamMember.MapFrom(x => x.TeamRoleId))
                .ForMember(x => x.TeamId, teamMember => teamMember.MapFrom(x => x.TeamId))
                .ReverseMap();
        }

        private string GeneratePhotoPath(string photoPath)
        {
            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(photoPath);

            return guid + extension;
        }
    }
}
