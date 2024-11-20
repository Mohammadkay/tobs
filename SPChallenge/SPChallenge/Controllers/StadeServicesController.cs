using Core.DTO_s;
using Core.Entities;
using Core.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Service.Interface;

namespace SPChallengeAPI.Controllers
{
    public class StadeServicesController : BaseController
    {
        private readonly IUnitOfWorkService _UnitOfWork;
        public StadeServicesController(IUnitOfWorkService UnitOfWork)
        {
            _UnitOfWork = UnitOfWork;
        }

        [Authorize(Roles = "Admin")]
        [HttpPost("AddStadeServices")]
        public async Task<IResponseResult<StadeService>> AddStadeServices(StadeServiceDTO entity)
        {
            var result = await _UnitOfWork.StadeServices.Value.Add(entity);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPost("AddStadeServicesRange")]
        public async Task<IResponseResult<IEnumerable<StadeService>>> AddStadeServicesRange(IEnumerable<StadeService> models)
        {
            var result = await _UnitOfWork.StadeServices.Value.AddRange(models);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("Get/{Id}")]
        public async Task<IResponseResult<StadeService>> GetStadeServices(long Id)
        {
            var result = await _UnitOfWork.StadeServices.Value.Get(Id);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("GetAllStadeServiceses")]
        public IResponseResult<IEnumerable<StadeService>> GetAllStadeServiceses()
        {
            var result = _UnitOfWork.StadeServices.Value.GetAll();
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPut("UpdateStadeServices")]
        public async Task<IResponseResult<StadeService>> UpdateStadeServices(StadeServiceDTO entity)
        {
            var result = await _UnitOfWork.StadeServices.Value.Update(entity);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPut("UpdateStadeServicesRange")]
        public async Task<IResponseResult<IEnumerable<StadeService>>> UpdateStadeServicesRange(IEnumerable<StadeService> models)
        {
            var result = await _UnitOfWork.StadeServices.Value.UpdateRange(models);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPost("AddStadeServicToStade")]
        public async Task<IResponseResult<StadeProvidedServices>> AddStadeServicToStade(StadeProvidedServicesDTO models)
        {
            var result = await _UnitOfWork.StadeProvdiedServices.Value.Add(models);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("RemoveStadeServiceFromStade")]
        public async Task<IResponseResult<bool>> RemoveStadeServiceFromStade(long Id)
        {
            var result = await _UnitOfWork.StadeProvdiedServices.Value.RemoveById(Id);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPost("SearchStadeService")]
        public async Task<IResponseResult<IEnumerable<Core.Entities.StadeService>>> SearchStadeService(StadeServiceSearchCritriaDTO oSearchCritria)
        {
            var result = await _UnitOfWork.StadeServices.Value.SearchStadeService(oSearchCritria);
            return result;
        }
    }
}
