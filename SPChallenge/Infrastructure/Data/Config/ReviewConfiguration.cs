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
    public class ReviewConfiguration : IEntityTypeConfiguration<Review>
    {
        public void Configure(EntityTypeBuilder<Review> builder)
        {
            builder.Property(p => p.Id).IsRequired();
            builder.Property(p => p.GameRview).IsRequired();
            builder.Property(p => p.StadeRview).IsRequired();
            builder.Property(p => p.RefreeRview).IsRequired();
            builder.Property(p => p.CreatedBy).IsRequired();
            builder.Property(p => p.CreationDate).IsRequired();
        }
    }
}
