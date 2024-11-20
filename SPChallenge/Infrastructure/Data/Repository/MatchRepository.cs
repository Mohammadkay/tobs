using Core;
using Core.Entities;
using Core.Interfaces;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Data.Repository
{
    public class MatchRepository : Repository<Match>, IMatchRepository
    {
        private readonly DBChallange _DB;
        public MatchRepository(DBChallange context) : base(context)
        {
            _DB = context;
        }

        public async Task<List<User>> GetMatchPlayers(long MatchId)
        {
            List<User> LUsers = _DB.Users.Where(U => (U.MatchPlayers != null) && (U.MatchPlayers.Where(MP => MP.MatchId == MatchId)).Count() > 0).ToList();
            return LUsers;
        }
    }
}
