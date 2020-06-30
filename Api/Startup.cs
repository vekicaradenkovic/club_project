using Application;
using Application.Commands;
using Application.DTOs;
using Application.Email;
using Application.Interfaces;
using AutoMapper;
using EfCommands;
using EfDataAccess;
using Implementation.Commands;
using Implementation.Email;
using Implementation.Jwt;
using Implementation.Logging;
using Implementation.Validators;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using Newtonsoft.Json;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace Api
{
	public class Startup
	{
		public Startup(IConfiguration configuration)
		{
			Configuration = configuration;
		}

		public IConfiguration Configuration { get; }

		// This method gets called by the runtime. Use this method to add services to the container.
		public void ConfigureServices(IServiceCollection services)
		{
			services.AddTransient<ClubDbContext>();
			services.AddAutoMapper(this.GetType().Assembly);
			services.AddTransient<IAddUserCommand, EfAddUserCommand>();
			services.AddTransient<IGetUserCommand, EfGetUserCommand>();
			services.AddTransient<IGetUsersCommand, EfGetUsersCommand>();
			services.AddTransient<IGetUsersAsQueriable, GetUsersAsQueryable>();
			services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>();
			services.AddTransient<IGetTeamRolesCommand, EfGetTeamRolesCommand>();
			services.AddTransient<IGetTeamRoleCommand, EfGetTeamRoleCommand>();
			services.AddTransient<IAddTeamRoleCommand, EfAddTeamRoleCommand>();
			services.AddTransient<IUpdateTeamRoleCommand, EfUpdateTeamRoleCommand>();
			services.AddTransient<IDeleteTeamRoleCommand, EfDeleteTeamRoleCommand>();
			services.AddTransient<IGetTeamsCommand, EfGetTeamsCommand>();
			services.AddTransient<IGetTeamCommand, EfGetTeamCommand>();
			services.AddTransient<IAddTeamCommand, EfAddTeamCommand>();
			services.AddTransient<IUpdateTeamCommand, EfUpdateTeamCommand>();
			services.AddTransient<IDeleteTeamCommand, EfDeleteTeamCommand>();
			services.AddTransient<IGetPositionsCommand, EfGetPositionsCommand>();
			services.AddTransient<IGetPositionCommand, EfGetPositionCommand>();
			services.AddTransient<IAddPositionCommand, EfAddPositionCommand>();
			services.AddTransient<IUpdatePositionCommand, EfUpdatePositionCommand>();
			services.AddTransient<IDeletePositionCommand, EfDeletePositionCommand>();
			services.AddTransient<IGetTeamMembersCommand, EfGetTeamMembersCommand>();
			services.AddTransient<IGetTeamMemberCommand, EfGetTeamMemberCommand>();
			services.AddTransient<IAddTeamMemberCommand, EfAddTeamMemberCommand>();
			services.AddTransient<IUpdateTeamMemberCommand, EfUpdateTeamMemberCommand>();
			services.AddTransient<IDeleteTeamMemberCommand, EfDeleteTeamMemberCommand>();
			services.AddTransient<IGetCountriesCommand, EfGetCountriesCommand>();
			services.AddTransient<IGetCountryCommand, EfGetCountryCommand>();
			services.AddTransient<IAddCountryCommand, EfAddCountryCommand>();
			services.AddTransient<IUpdateCountryCommand, EfUpdateCountryCommand>();
			services.AddTransient<IDeleteCountryCommand, EfDeleteCountryCommand>();
			services.AddTransient<IGetAuditLogsCommand, EfGetAuditLogsCommand>();
			services.AddTransient<IGetUseCasesCommand, EfGetUseCasesCommand>();
			services.AddTransient<IAddUseCaseToUserCommand, EfAddUseCaseToUserCommand>();
			services.AddTransient<IDeleteUserUseCaseCommand, EfDeleteUserUseCaseCommand>();
			services.AddHttpContextAccessor();
			services.AddTransient<IApplicationActor>(x =>
			{
				var accessor = x.GetService<IHttpContextAccessor>();
				//izvuci token
				//pozicionirati se na payload
				//izvuci ActorData claim
				//Deserijalizovati actorData string u c# objekat

				var user = accessor.HttpContext.User;

				if (user.FindFirst("UserData") == null)
				{
					return new JwtUserData();
				}

				var actorString = user.FindFirst("UserData").Value;

				var actor = JsonConvert.DeserializeObject<JwtUserData>(actorString);

				return actor;

			});
			services.AddTransient<IUseCaseLogger, DatabaseUseCaseLogger>();
			services.AddTransient<UseCaseExecutor>();
			services.AddTransient<RegisterUserValidator>();
			services.AddTransient<UpdateUserValidator>();
			services.AddTransient<SearchValidator>();
			services.AddTransient<CreateTeamRoleValidator>();
			services.AddTransient<CreateTeamValidator>();
			services.AddTransient<CreatePositionValidator>();
			services.AddTransient<CreateTeamMemberValidator>();
			services.AddTransient<CreateCountryValidator>();
			services.AddTransient<CreateUseCaseToUserValidator>();
			services.AddTransient<JwtManager>();
			services.AddTransient<IEmailSender, EmailSmtpSender>();
			services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
			.AddJwtBearer(options =>
			{
				options.TokenValidationParameters = new TokenValidationParameters
				{
					ValidateIssuer = true,
					ValidateAudience = true,
					ValidateLifetime = true,
					ValidateIssuerSigningKey = true,
					ValidIssuer = "asp_api",
					ValidAudience = "Any",
					IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey"))
				};
			});
			services.AddDirectoryBrowser();
			services.AddControllers();
			services.AddSwaggerGen(c =>
			{
				c.SwaggerDoc("v1", new OpenApiInfo { Title = "My Club API", Version = "v1" });
				c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
				{
					Description =
						"JWT Authorization header using the Bearer scheme. \r\n\r\n Enter 'Bearer' [space] and then your token in the text input below.\r\n\r\nExample: \"Bearer 12345abcdef\"",
									Name = "Authorization",
									In = ParameterLocation.Header,
									Type = SecuritySchemeType.ApiKey,
									Scheme = "Bearer"
								});

								c.AddSecurityRequirement(new OpenApiSecurityRequirement()
				{
					{
						new OpenApiSecurityScheme
						{
							Reference = new OpenApiReference
							{
								Type = ReferenceType.SecurityScheme,
								Id = "Bearer"
							},
							Scheme = "oauth2",
							Name = "Bearer",
							In = ParameterLocation.Header,

						},
						new List<string>()
					}
				});
			});
		}

		// This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
		public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
		{
			if (env.IsDevelopment())
			{
				app.UseDeveloperExceptionPage();
			}

			app.UseStaticFiles(); // For the wwwroot folder

			app.UseStaticFiles(new StaticFileOptions
			{
				FileProvider = new PhysicalFileProvider(
					Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images")),
				RequestPath = "/MyImages"
			});

			app.UseDirectoryBrowser(new DirectoryBrowserOptions
			{
				FileProvider = new PhysicalFileProvider(
					Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "images")),
				RequestPath = "/MyImages"
			});

			app.UseSwagger();

			app.UseSwaggerUI(c =>
			{
				c.SwaggerEndpoint("/swagger/v1/swagger.json", "My Club API V1");
			});

			app.UseHttpsRedirection();

			app.UseCors(x =>
			{
				x.AllowAnyOrigin();
				x.AllowAnyMethod();
				x.AllowAnyHeader();
			});

			app.UseRouting();

			app.UseAuthentication();
			app.UseAuthorization();

			app.UseEndpoints(endpoints =>
			{
				endpoints.MapControllers();
			});
		}
	}
}
