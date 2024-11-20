using Core.DTO_s;
using Core.Entities;
using Core.Interfaces;
using Core.Shared;
using Service.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using static Core.Enums;

namespace Service.Services
{
    public class StadeProvdiedServices : IStadeProvdiedServices
    {
        private readonly IUnitOfWorkRepository _UnitOfWork;
        public StadeProvdiedServices(IUnitOfWorkRepository UnitOfWork)
        {
            _UnitOfWork = UnitOfWork;
        }

        #region Add
        public async Task<IResponseResult<StadeProvidedServices>> Add(StadeProvidedServices entity)
        {
            var result = await _UnitOfWork.StadeProvdiedServices.Value.Add(entity);

            return (result == null ?
                 new ResponseResult<StadeProvidedServices>()
                 {
                     Errors = new List<string>() { "Error In Adding Stade Provdied Services" },
                     Status = ResultStatus.Fail,
                     Data = result,
                     TotalRecords = 0
                 } :
                new ResponseResult<StadeProvidedServices>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region Add DTO
        public async Task<IResponseResult<StadeProvidedServices>> Add(StadeProvidedServicesDTO entity)
        {

            var Staderesult = await _UnitOfWork.Stade.Value.Get(entity.StadeId);
            var StadeServicesresult = await _UnitOfWork.StadeServices.Value.Get(entity.StadeServiceId);

            if (Staderesult != null && StadeServicesresult != null)
            {
                return new ResponseResult<StadeProvidedServices>()
                {
                    Errors = new List<string>() { "Stade or Stade Sevice not exists" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }

            StadeProvidedServices oStadeProvidedServices = new StadeProvidedServices()
            {
                StadeId = entity.StadeId,
                StadeServiceId = entity.StadeServiceId,
                CreationDate = DateTime.Now,
                CreatedBy = entity.CreatedBy,
            };

            var result = await _UnitOfWork.StadeProvdiedServices.Value.Add(oStadeProvidedServices);

            return (result == null ?
                 new ResponseResult<StadeProvidedServices>()
                 {
                     Errors = new List<string>() { "Error In Adding Stade Provdied Services" },
                     Status = ResultStatus.Fail,
                     Data = result,
                     TotalRecords = 0
                 } :
                new ResponseResult<StadeProvidedServices>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region Get
        public async Task<IResponseResult<StadeProvidedServices>> Get(long Id)
        {

            var result = await _UnitOfWork.StadeProvdiedServices.Value.Get(Id);

            return (result == null ?
                 new ResponseResult<StadeProvidedServices>()
                 {
                     Errors = new List<string>() { "Error In Get Stade Provided Services" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } : new ResponseResult<StadeProvidedServices>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 });
        }
        #endregion

        #region RemoveById
        public async Task<IResponseResult<bool>> RemoveById(long StadeProvidedServicesId)
        {

            StadeProvidedServices? oStadeProvdiedServices = _UnitOfWork.StadeProvdiedServices.Value.Find(S => S.Id == StadeProvidedServicesId).FirstOrDefault();

            if (oStadeProvdiedServices == null)
            {
                return new ResponseResult<bool>()
                {
                    Errors = new List<string>() { "Stade Provided Services Id Not Exists" },
                    Status = ResultStatus.Fail,
                    Data = false,
                    TotalRecords = 0
                };
            }

            var result = await _UnitOfWork.StadeProvdiedServices.Value.Remove(oStadeProvdiedServices);

            return (result == null ?
                new ResponseResult<bool>()
                {
                    Errors = new List<string>() { "Error In Remove Stade Provdied Services" },
                    Status = ResultStatus.Fail,
                    Data = false,
                    TotalRecords = 0
                } :
                new ResponseResult<bool>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = true,
                    TotalRecords = 1
                });
        }
        #endregion

        #region NotImplemented
        public IEnumerable<StadeProvidedServices> RemoveRange(IEnumerable<StadeProvidedServices> models)
        {
            throw new NotImplementedException();
        }

        public IResponseResult<IEnumerable<StadeProvidedServices>> RemoveRangeByIDs(IEnumerable<long> IDs)
        {
            throw new NotImplementedException();
        }
        public Task<IResponseResult<StadeProvidedServices>> Update(StadeProvidedServices entity)
        {
            throw new NotImplementedException();
        }
        public Task<IResponseResult<IEnumerable<StadeProvidedServices>>> UpdateRange(IEnumerable<StadeProvidedServices> models)
        {
            throw new NotImplementedException();
        }
        public Task<IResponseResult<IEnumerable<StadeProvidedServices>>> AddRange(IEnumerable<StadeProvidedServices> models)
        {
            throw new NotImplementedException();
        }
        public IResponseResult<IEnumerable<StadeProvidedServices>> GetAll()
        {
            throw new NotImplementedException();
        }
        public IResponseResult<StadeProvidedServices> Remove(StadeProvidedServices entity)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
