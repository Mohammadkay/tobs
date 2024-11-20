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
    public class MatchPlayersConfiguration : IEntityTypeConfiguration<MatchPlayers>
    {
        public void Configure(EntityTypeBuilder<MatchPlayers> builder)
        {
            builder.HasOne<User>(MP => MP.User).WithMany(U => U.MatchPlayers).HasForeignKey(MP => MP.UserId).OnDelete(DeleteBehavior.ClientNoAction); ;
            builder.HasOne<Match>(MP => MP.Match).WithMany(U => U.MatchPlayers).HasForeignKey(MP => MP.MatchId).OnDelete(DeleteBehavior.ClientNoAction); ;
            builder.HasOne<Review>(MP => MP.Review).WithMany(U => U.MatchPlayers).HasForeignKey(MP => MP.ReviewId).OnDelete(DeleteBehavior.ClientNoAction); ;
        }
    }
}
