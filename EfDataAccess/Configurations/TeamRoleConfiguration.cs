using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
	public class TeamRoleConfiguration : IEntityTypeConfiguration<TeamRole>
    {
        public void Configure(EntityTypeBuilder<TeamRole> builder)
        {
            builder.Property(tr => tr.RoleName)
                   .IsRequired()
                   .HasMaxLength(50);

            builder.Property(tr => tr.DateCreated)
                   .HasDefaultValueSql("getdate()");
        }
    }
}
