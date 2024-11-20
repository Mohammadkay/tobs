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
    public class StadeConfiguration : IEntityTypeConfiguration<Stade>
    {
        public void Configure(EntityTypeBuilder<Stade> builder)
        {
            builder.Property(p => p.Id).IsRequired();
            builder.Property(p => p.Name).IsRequired();
            builder.Property(p => p.MobileNo).IsRequired();
            builder.Property(p => p.Status).IsRequired();
            builder.Property(p => p.Address).IsRequired();
            builder.Property(p => p.Longitude).IsRequired();
            builder.Property(p => p.Latitude).IsRequired();
            builder.Property(p => p.Capacity).IsRequired();
            builder.Property(p => p.StadeType).IsRequired();
            builder.Property(p => p.CreatedBy).IsRequired();
            builder.Property(p => p.CreationDate).IsRequired();
        }
    }
}
