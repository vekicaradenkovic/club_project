using Application.Commands;
using Application.DTOs;
using EfDataAccess;
using Implementation.Commnds;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;

namespace Implementation.Jwt
{
    public class JwtManager : BaseCommand
    {
        private readonly IGetUsersAsQueriable _usersCommand;
        public JwtManager(ClubDbContext context, IGetUsersAsQueriable usersCommand) : base(context) 
        {
            _usersCommand = usersCommand;
        }

        public string MakeToken(string username, string password)
        {
            var user = _usersCommand.GetNotDeletedUsersWithUseCases()
                                    .FirstOrDefault(x => x.Username == username && x.Password == password);

            if (user == null)
            {
                return null;
            }

            var issuer = "asp_api";
            var secretKey = "ThisIsMyVerySecretKey";

            var userData = new JwtUserData
            {
                AllowedUseCases = user.UserUserCases.Select(x => x.UseCaseId),
                Id = user.Id,
                Username = user.Username
            };

            var claims = new List<Claim> // Jti : "", 
            {
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString(), ClaimValueTypes.String, issuer),
                new Claim(JwtRegisteredClaimNames.Sub, user.Id.ToString(), ClaimValueTypes.Integer,issuer),
                new Claim(JwtRegisteredClaimNames.Iss, "asp_api", ClaimValueTypes.String, issuer),
				new Claim(JwtRegisteredClaimNames.Iat, DateTimeOffset.UtcNow.ToUnixTimeSeconds().ToString(), ClaimValueTypes.Integer64, issuer),
				new Claim("UserData", JsonConvert.SerializeObject(userData), ClaimValueTypes.String, issuer)
			};

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(secretKey));

            var credentials = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var now = DateTime.Now;
            var token = new JwtSecurityToken(
                issuer: issuer,
                audience: "Any",
                claims: claims,
                notBefore: now,
                expires: now.Add(TimeSpan.FromMinutes(86400)),
                signingCredentials: credentials);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
