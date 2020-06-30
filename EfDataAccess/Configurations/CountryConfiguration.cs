using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EfDataAccess.Configurations
{
	public class CountryConfiguration : IEntityTypeConfiguration<Country>
    {
        public void Configure(EntityTypeBuilder<Country> builder)
        {
            builder.Property(p => p.CountryName)
                   .IsRequired();

            builder.Property(p => p.DateCreated)
                   .HasDefaultValueSql("getdate()");
        }
    }
}
