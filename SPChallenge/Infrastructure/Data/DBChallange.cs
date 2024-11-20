using Core.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Options;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Data
{
    public class DBChallange : DbContext
    {
     // add-migration InitialIdentityModel-v1 -OutputDir ".\Data\Migrations\" -Project Infrastructure
     // Remove-Migration -Force -Project "Infrastructure" -StartupProject "SPChallengeAPI" 
     // update-database

        public DbSet<Match> Matchs { get; set; }
        public DbSet<Review> Reviews { get; set; }
        public DbSet<Stade> Stades { get; set; }
        public DbSet<StadeService> StadeServices { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<MatchPlayers> MatchPlayers { get; set; }
        public DbSet<PlayerStatistics> PlayerStatistics { get; set; }
        public DbSet<StadeProvidedServices> StadeProvidedServices { get; set; }

        public DBChallange(DbContextOptions options, IConfiguration configuration) : base(options)
        {           
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            modelBuilder.ApplyConfigurationsFromAssembly(Assembly.GetExecutingAssembly());
        }
    }
}
