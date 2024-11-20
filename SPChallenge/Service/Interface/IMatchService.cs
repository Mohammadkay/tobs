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
    public interface IMatchService : IService<Match>
    {
        Task<IResponseResult<IEnumerable<Core.Entities.Match>>> SearchMatch(MatchSearchCritriaDTO oSearchCritria);
        Task<IResponseResult<Match>> Update(MatchDTO entity);
        Task<IResponseResult<Match>> Add(MatchDTO entity);
        Task<IResponseResult<IEnumerable<Core.Entities.User>>> GetAllMathcPlayer(Int64 MatchId);
    }
}
