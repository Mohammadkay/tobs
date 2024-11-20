using Core.Entities;
using Core.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Infrastructure.Data.Repository
{
    public class MatchPlayersRepository : Repository<MatchPlayers>, IMatchPlayersRepository
    {
        private readonly DBChallange _DB;
        public MatchPlayersRepository(DBChallange context) : base(context)
        {
            _DB = context;
        }
    }
}
