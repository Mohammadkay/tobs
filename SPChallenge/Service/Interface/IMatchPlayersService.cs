using Core.DTO_s;
using Core.Entities;
using Core.Shared;
using Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Interface
{
    public interface IMatchPlayersService : IService<MatchPlayers>
    {
        Task<IResponseResult<bool>> Remove(long MatchId, long PlayerId);
        Task<IResponseResult<MatchPlayers>> Add(MatchPlayerDTO entity);
    }
}
