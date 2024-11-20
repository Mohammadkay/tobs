using Core.DTO_s;
using Core.Entities;
using Core.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Service.Interface;

namespace SPChallengeAPI.Controllers
{
    public class MatchController : BaseController
    {
        private readonly IUnitOfWorkService _UnitOfWork;
        public MatchController(IUnitOfWorkService UnitOfWork)
        {
            _UnitOfWork = UnitOfWork;
        }

        [Authorize(Roles = "Admin")]
        [HttpPost("AddMatch")]
        public async Task<IResponseResult<Match>> AddMatch(MatchDTO entity)
        {
            var result = await _UnitOfWork.Match.Value.Add(entity);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPost("AddMatchRange")]
        public async Task<IResponseResult<IEnumerable<Match>>> AddMatchRange(IEnumerable<Match> models)
        {
            var result = await _UnitOfWork.Match.Value.AddRange(models);
            return result;
        }

        [Authorize(Roles = "Player,Admin")]
        [HttpGet("Get/{Id}")]
        public async Task<IResponseResult<Match>> GetMatch(long Id)
        {
            var result = await _UnitOfWork.Match.Value.Get(Id);
            return result;
        }

        [Authorize(Roles = "Player,Admin")]
        [HttpGet("GetAllMatches")]
        public IResponseResult<IEnumerable<Match>> GetAllMatches()
        {
            var result = _UnitOfWork.Match.Value.GetAll();
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPut("UpdateMatch")]
        public async Task<IResponseResult<Match>> UpdateMatch(MatchDTO entity)
        {
            var result = await _UnitOfWork.Match.Value.Update(entity);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPut("UpdateMatchRange")]
        public async Task<IResponseResult<IEnumerable<Match>>> UpdateMatchRange(IEnumerable<Match> models)
        {
            var result = await _UnitOfWork.Match.Value.UpdateRange(models);
            return result;
        }

        [Authorize(Roles = "Admin,Player")]
        [HttpPost("JoinMatch")]
        public async Task<IResponseResult<MatchPlayers>> JoinMatch(MatchPlayerDTO entity)
        {
            var result =await _UnitOfWork.MatchPlayers.Value.Add(entity);
            return result;
        }

        [Authorize(Roles = "Admin,Player")]
        [HttpDelete("LeaveMatch")]
        public async Task<IResponseResult<bool>> LeaveMatch(long MatchId, long UserId)
        {
            var result = await _UnitOfWork.MatchPlayers.Value.Remove(MatchId, UserId);
            return result;
        }

        [Authorize(Roles = "Admin,Player")]
        [HttpPost("SearchMatch")] 
        public async Task<IResponseResult<IEnumerable<Core.Entities.Match>>> SearchMatch(MatchSearchCritriaDTO oSearchCritria) 
        {
            var result = await _UnitOfWork.Match.Value.SearchMatch(oSearchCritria);
            return result;
        }

        [Authorize(Roles = "Admin,Player")]
        [HttpGet("GetAllMathcPlayer")]
        public async Task<IResponseResult<IEnumerable<Core.Entities.User>>> GetAllMathcPlayer(Int64 MatchId)
        {
            var result = await _UnitOfWork.Match.Value.GetAllMathcPlayer(MatchId);
            return result;
        }
    }
}
