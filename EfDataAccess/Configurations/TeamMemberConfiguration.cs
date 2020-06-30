using Domain;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace EfDataAccess.Configurations
{
    public class TeamMemberConfiguration : IEntityTypeConfiguration<TeamMember>
    {
        public void Configure(EntityTypeBuilder<TeamMember> builder)
        {
            builder.Property(tm => tm.FirstName)
                   .IsRequired()
                   .HasMaxLength(70);

            builder.Property(tm => tm.LastName)
                   .IsRequired()
                   .HasMaxLength(70);


            builder.Property(tm => tm.DateOfBirth).IsRequired();

            builder.Property(tm => tm.DateCreated)
                   .HasDefaultValueSql("getdate()");
        }
    }
}
