using Domain;
using EfDataAccess.Configurations;
using Microsoft.EntityFrameworkCore;
using System;

namespace EfDataAccess
{
    public class ClubDbContext : DbContext
    {
        public DbSet<User> Users { get; set; }
        public DbSet<Team> Teams { get; set; }
        public DbSet<TeamMember> TeamMembers { get; set; }
        public DbSet<Country> Countries { get; set; }
        public DbSet<TeamRole> TeamRoles { get; set; }
        public DbSet<Position> Positions { get; set; }
        public DbSet<UseCaseLog> UseCaseLogs { get; set; }
        public DbSet<UserUseCase> UserUseCases { get; set; }
        public DbSet<UseCase> UseCases { get; set; }

        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                if (entry.Entity is BaseEntity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.DateCreated = DateTime.Now;
                            break;
                        case EntityState.Modified:
                            e.DateModified = DateTime.Now;
                            break;
                        case EntityState.Deleted:
                            e.DeletedAt = DateTime.Now;
                            break;
                    }
                }
            }

            return base.SaveChanges();
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=desktop-ol686hv\sqlexpress;Initial Catalog=club_project;Integrated Security=True;Pooling=False", b => b.MigrationsAssembly("EfDataAccess"));
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new UserConfiguration());
            modelBuilder.ApplyConfiguration(new TeamConfiguration());
            modelBuilder.ApplyConfiguration(new TeamMemberConfiguration());
            modelBuilder.ApplyConfiguration(new TeamRoleConfiguration());
            modelBuilder.ApplyConfiguration(new CountryConfiguration());
            modelBuilder.ApplyConfiguration(new PositionConfiguration());
            modelBuilder.ApplyConfiguration(new UseCaseConfiguration());
        }
    }
}
