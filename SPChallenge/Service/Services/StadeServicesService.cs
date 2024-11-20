using Core.DTO_s;
using Core.Interfaces;
using Core.Shared;
using Service.Interface;
using System.Linq.Expressions;
using static Core.Enums;

namespace Service.Services
{
    public class StadeServicesServices : IStadeServicesService
    {
        private readonly IUnitOfWorkRepository _UnitOfWork;
        public StadeServicesServices(IUnitOfWorkRepository UnitOfWork)
        {
            _UnitOfWork = UnitOfWork;
        }

        #region Add
        public async Task<IResponseResult<Core.Entities.StadeService>> Add(Core.Entities.StadeService entity)
        {
            entity = await ImageHandler.HandleImage(entity, entity.Image,entity.ImageName, ImagesTypes.StadeService);
            var result = await _UnitOfWork.StadeServices.Value.Add(entity);

            return (result == null ?
                 new ResponseResult<Core.Entities.StadeService>()
                 {
                     Errors = new List<string>() { "Error In Adding StadeServices" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<Core.Entities.StadeService>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region Add DTO
        public async Task<IResponseResult<Core.Entities.StadeService>> Add(StadeServiceDTO entity)
        {
            Core.Entities.StadeService ostadeService = new Core.Entities.StadeService()
            {
                Name = entity.Name,
                CreatedBy = entity.CreatedBy,
                CreationDate = DateTime.Now,
                ModificationDate = null,
                ModifiedBy = null
            };

            ostadeService = await ImageHandler.HandleImage(ostadeService,entity.Image, entity.ImageName, ImagesTypes.StadeService);
            var result = await _UnitOfWork.StadeServices.Value.Add(ostadeService);

            return (result == null ?
                 new ResponseResult<Core.Entities.StadeService>()
                 {
                     Errors = new List<string>() { "Error In Adding StadeServices" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<Core.Entities.StadeService>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 });
        }
        #endregion

        #region AddRange
        public async Task<IResponseResult<IEnumerable<Core.Entities.StadeService>>> AddRange(IEnumerable<Core.Entities.StadeService> models)
        {
            var result = await _UnitOfWork.StadeServices.Value.AddRange(models);

            return (result == null ?
                 new ResponseResult<IEnumerable<Core.Entities.StadeService>>()
                 {
                     Errors = new List<string>() { "Error In Adding StadeServices" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<IEnumerable<Core.Entities.StadeService>>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 });
        }
        #endregion

        #region Get
        public async Task<IResponseResult<Core.Entities.StadeService>> Get(long Id)
        {
            var result = await _UnitOfWork.StadeServices.Value.Get(Id);

            return (result == null ?
                 new ResponseResult<Core.Entities.StadeService>()
                 {
                     Errors = new List<string>() { "Error In Get StadeServices" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<Core.Entities.StadeService>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region GetAll
        public IResponseResult<IEnumerable<Core.Entities.StadeService>> GetAll()
        {
            var result = _UnitOfWork.StadeServices.Value.GetAll();

            return (result == null ?
                 new ResponseResult<IEnumerable<Core.Entities.StadeService>>()
                 {
                     Errors = new List<string>() { "Error In Get All StadeServices" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<IEnumerable<Core.Entities.StadeService>>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 });
        }
        #endregion

        #region Update
        public async Task<IResponseResult<Core.Entities.StadeService>> Update(Core.Entities.StadeService entity)
        {
            entity = await ImageHandler.HandleImage(entity,entity.Image, entity.ImageName, ImagesTypes.StadeService);
            var result = await _UnitOfWork.StadeServices.Value.Update(entity);

            return (result == null ?
                 new ResponseResult<Core.Entities.StadeService>()
                 {
                     Errors = new List<string>() { "Error In Update StadeServices" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<Core.Entities.StadeService>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region Update DTO
        public async Task<IResponseResult<Core.Entities.StadeService>> Update(StadeServiceDTO entity)
        {
            Core.Entities.StadeService ostadeService = await _UnitOfWork.StadeServices.Value.Get(entity.Id);

            if (ostadeService == null)
            {
                return new ResponseResult<Core.Entities.StadeService>()
                {
                    Errors = new List<string>() { "Stade Services Not Exists !" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }

            ostadeService.Name = entity.Name;
            ostadeService.ModifiedBy = entity.CreatedBy;
            ostadeService.ModificationDate = DateTime.Now;

            ostadeService = await ImageHandler.HandleImage(ostadeService,entity.Image, entity.ImageName, ImagesTypes.StadeService);
            var result = await _UnitOfWork.StadeServices.Value.Update(ostadeService);

            return (result == null ?
                new ResponseResult<Core.Entities.StadeService>()
                {
                    Errors = new List<string>() { "Error In Update StadeServices" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                } :
                new ResponseResult<Core.Entities.StadeService>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region UpdateRange
        public async Task<IResponseResult<IEnumerable<Core.Entities.StadeService>>> UpdateRange(IEnumerable<Core.Entities.StadeService> models)
        {
            var result = await _UnitOfWork.StadeServices.Value.UpdateRange(models);

            return (result == null ?
                 new ResponseResult<IEnumerable<Core.Entities.StadeService>>()
                 {
                     Errors = new List<string>() { "Error In Update All StadeServices" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<IEnumerable<Core.Entities.StadeService>>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region SearchStadeService
        public async Task<IResponseResult<IEnumerable<Core.Entities.StadeService>>> SearchStadeService(StadeServiceSearchCritriaDTO oSearchCritria)
        {
            long TotalRecords = 0;

            List<Expression<Func<Core.Entities.StadeService, bool>>> filterExpressions = new List<Expression<Func<Core.Entities.StadeService, bool>>>();

            if (oSearchCritria.StadeId.HasValue)
            {
                filterExpressions.Add(S => (S.StadeProvdiedServices != null) && (S.StadeProvdiedServices.Where(SP => SP.StadeId == oSearchCritria.StadeId)).Count() > 0);
            }

            var result = _UnitOfWork.StadeServices.Value.GetByCriteria(
                filterExpressions,
                oSearchCritria.pageSize,
                out TotalRecords,
                oSearchCritria.pageNo,
                true
                 )?.ToList();

            return (result == null ?
                 new ResponseResult<IEnumerable<Core.Entities.StadeService>>()
                 {
                     Errors = new List<string>() { "Error In Get Stade Provided Services" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<IEnumerable<Core.Entities.StadeService>>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = TotalRecords
                 });
        }
        #endregion

        #region NotImplementedException
        public IResponseResult<Core.Entities.StadeService> Remove(Core.Entities.StadeService entity)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Core.Entities.StadeService> RemoveRange(IEnumerable<Core.Entities.StadeService> models)
        {
            throw new NotImplementedException();
        }

        public IResponseResult<IEnumerable<Core.Entities.StadeService>> RemoveRangeByIDs(IEnumerable<long> IDs)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
