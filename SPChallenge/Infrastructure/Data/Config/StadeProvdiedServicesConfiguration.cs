using Core.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Data.Config
{
    public class StadeProvdiedServicesConfiguration : IEntityTypeConfiguration<StadeProvidedServices>
    {
        public void Configure(EntityTypeBuilder<StadeProvidedServices> builder)
        {
            builder.HasOne<Stade>(sp => sp.Stade).WithMany(s => s.StadeProvdiedServices).HasForeignKey(sp => sp.StadeId).OnDelete(DeleteBehavior.ClientNoAction);
            builder.HasOne<StadeService>(sp => sp.StadeService).WithMany(s => s.StadeProvdiedServices).HasForeignKey(sp => sp.StadeServiceId).OnDelete(DeleteBehavior.ClientNoAction);
        }
    }
}
