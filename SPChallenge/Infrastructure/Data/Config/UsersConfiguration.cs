using Core.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Data.Config
{
    public class UsersConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            builder.Property(p => p.Id).IsRequired();
            builder.Property(p => p.UserName).IsRequired().HasMaxLength(200);
            builder.HasIndex(p => p.UserName).IsUnique();
            builder.Property(p => p.FirstName).IsRequired().HasMaxLength(100);
            builder.Property(p => p.LastName).IsRequired().HasMaxLength(100);
            builder.Property(p => p.Gender).IsRequired();
            builder.Property(p => p.MobileNo).IsRequired().HasMaxLength(30);
            builder.HasIndex(e => e.MobileNo).IsUnique();
            builder.Property(p => p.BirthDate).IsRequired();
            builder.Property(p => p.PasswordHash).IsRequired();
            builder.Property(p => p.PasswordSalt).IsRequired();
            builder.Property(p => p.Address).IsRequired();
            builder.Property(p => p.CreatedBy).IsRequired();
            builder.Property(p => p.CreationDate).IsRequired();
            builder.HasOne(p => p.PlayerStatistics).WithOne(p => p.User).HasForeignKey<PlayerStatistics>(s => s.UserId);
        }
    }
}
