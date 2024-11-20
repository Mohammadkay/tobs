using Core.DTO_s;
using Core.Entities;
using Core.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Service.Interface;

namespace SPChallengeAPI.Controllers
{
    public class StadeController : BaseController
    {
        private readonly IUnitOfWorkService _UnitOfWork;
        public StadeController(IUnitOfWorkService UnitOfWork)
        {
            _UnitOfWork = UnitOfWork;
        }


        [Authorize(Roles = "Admin")]
        [HttpPost("AddStade")]
        public async Task<IResponseResult<Stade>> AddStade(StadeDTO entity)
        {
            var result = await _UnitOfWork.Stade.Value.Add(entity);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPost("AddStadeRange")]
        public async Task<IResponseResult<IEnumerable<Stade>>> AddStadeRange(IEnumerable<Stade> models)
        {
            var result = await _UnitOfWork.Stade.Value.AddRange(models);
            return result;
        }

        [Authorize(Roles = "Player,Admin")]
        [HttpGet("Get/{Id}")]
        public async Task<IResponseResult<Stade>> GetStade(long Id)
        {
            var result = await _UnitOfWork.Stade.Value.Get(Id);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("GetAllStadees")]
        public IResponseResult<IEnumerable<Stade>> GetAllStadees()
        {
            var result = _UnitOfWork.Stade.Value.GetAll();
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPut("UpdateStade")]
        public async Task<IResponseResult<Stade>> UpdateStade(StadeDTO entity)
        {
            var result = await _UnitOfWork.Stade.Value.Update(entity);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPut("UpdateStadeRange")]
        public async Task<IResponseResult<IEnumerable<Stade>>> UpdateStadeRange(IEnumerable<Stade> models)
        {
            var result = await _UnitOfWork.Stade.Value.UpdateRange(models);
            return result;
        }

        [Authorize(Roles = "Admin,Player")]
        [HttpPost("SearchStade")]
        public async Task<IResponseResult<IEnumerable<Core.Entities.Stade>>> SearchStade(SearchStadeCritriaDTO oSearchCritria)
        {
            var result = await _UnitOfWork.Stade.Value.SearchStade(oSearchCritria);
            return result;
        }
    }
}
