using Core.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Data.Config
{
    public class MatchConfiguration : IEntityTypeConfiguration<Match>
    {
        public void Configure(EntityTypeBuilder<Match> builder)
        {
            builder.Property(M => M.Id).IsRequired();
            builder.Property(M => M.Name).IsRequired().HasMaxLength(200);
            builder.Property(M => M.StartDate).IsRequired();
            builder.Property(M => M.EndDate).IsRequired();
            builder.Property(M => M.Capacity).IsRequired();
            builder.Property(M => M.Gender).IsRequired();
            builder.Property(M => M.AgeFrom).IsRequired();
            builder.Property(M => M.AgeTo).IsRequired();
            builder.Property(M => M.Price).IsRequired();
            builder.Property(M => M.CreatedBy).IsRequired();
            builder.Property(M => M.CreationDate).IsRequired();
            builder.HasOne<Stade>(M => M.Stade).WithMany(s => s.Matchs).HasForeignKey(M => M.StadeId).IsRequired();
            builder.HasOne<User>(M => M.ManOfTheGame).WithMany(s => s.Matchs).HasForeignKey(M => M.ManOfTheGameId);
        }
    }
}
