using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
namespace EfDataAccess.Configurations
{
	public class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.Property(u => u.FirstName)
                   .HasMaxLength(150);

            builder.Property(u => u.LastName)
                   .HasMaxLength(150);

            builder.Property(u => u.Username)
                   .IsRequired()
                   .HasMaxLength(50);

            builder.Property(u => u.Password)
                   .IsRequired()
                   .HasMaxLength(250);

            builder.HasIndex(u => u.Username).IsUnique();

            builder.Property(u => u.IsActive).HasDefaultValueSql("0");

            builder.Property(u => u.DateCreated)
                   .HasDefaultValueSql("getdate()");
        }
    }
}
