using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
	public class TeamConfiguration : IEntityTypeConfiguration<Team>
	{
		public void Configure(EntityTypeBuilder<Team> builder)
		{
            builder.Property(tm => tm.TeamName)
                   .IsRequired()
                   .HasMaxLength(80);

            builder.Property(tm => tm.DateCreated)
                   .HasDefaultValueSql("getdate()");
        }
	}
}
