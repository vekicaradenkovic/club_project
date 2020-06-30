using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace EfDataAccess.Configurations
{
    public class PositionConfiguration : IEntityTypeConfiguration<Position>
    {
        public void Configure(EntityTypeBuilder<Position> builder)
        {
            builder.Property(p => p.PositionName)
                   .IsRequired()
                   .HasMaxLength(50);

            builder.Property(p => p.DateCreated)
                   .HasDefaultValueSql("getdate()");
        }
    }
}
