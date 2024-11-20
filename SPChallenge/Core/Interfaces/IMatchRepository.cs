using Core.Entities;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Core.Interfaces
{
    public interface IMatchRepository : IRepository<Match>
    {
        Task<List<User>> GetMatchPlayers(long MatchId);
    }
}
