using Core.DTO_s;
using Core.Entities;
using Core.Interfaces;
using Core.Shared;
using Service.Interface;
using System.Linq.Expressions;
using static Core.Enums;

namespace Service.Services
{
    public class StadeService : IStadeService
    {
        private readonly IUnitOfWorkRepository _UnitOfWork;

        public StadeService(IUnitOfWorkRepository UnitOfWork)
        {
            _UnitOfWork = UnitOfWork;
        }

        #region Add
        public async Task<IResponseResult<Stade>> Add(Stade entity)
        {
            var result = await _UnitOfWork.Stade.Value.Add(entity);

            return (result == null ?
                 new ResponseResult<Stade>()
                 {
                     Errors = new List<string>() { "Error In Adding Stade" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<Stade>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region Add DTO
        public async Task<IResponseResult<Stade>> Add(StadeDTO entity)
        {
            Stade oStade = new Stade()
            {
                ModificationDate = null,
                ModifiedBy = null,
                CreatedBy = entity.CreatedBy,
                CreationDate = DateTime.Now,
                Address = entity.Address,
                Capacity = entity.Capacity,
                Email = entity.Email,
                Latitude = entity.Latitude,
                Longitude = entity.Longitude,
                MobileNo = entity.MobileNo,
                Name = entity.Name,
                StadeType = entity.StadeType,
                Status = entity.Status,
                StatusDes = entity.StatusDes
            };

            oStade = await ImageHandler.HandleImage(oStade, entity.Image, entity.ImageName, ImagesTypes.Stade);

            var result = await _UnitOfWork.Stade.Value.Add(oStade);

            return (result == null ?
                 new ResponseResult<Stade>()
                 {
                     Errors = new List<string>() { "Error In Adding Stade" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<Stade>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region AddRange
        public async Task<IResponseResult<IEnumerable<Stade>>> AddRange(IEnumerable<Stade> models)
        {

            var result = await _UnitOfWork.Stade.Value.AddRange(models);

            return (result == null ?
                 new ResponseResult<IEnumerable<Stade>>()
                 {
                     Errors = new List<string>() { "Error In Adding Stade" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<IEnumerable<Stade>>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region Get
        public async Task<IResponseResult<Stade>> Get(long Id)
        {
            var result = await _UnitOfWork.Stade.Value.Get(Id);

            return (result == null ?
                new ResponseResult<Stade>()
                {
                    Errors = new List<string>() { "Error In Get Stade" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                } :
                new ResponseResult<Stade>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region GetAll
        public IResponseResult<IEnumerable<Stade>> GetAll()
        {
            var result = _UnitOfWork.Stade.Value.GetAll();

            return (result == null ?
                 new ResponseResult<IEnumerable<Stade>>()
                 {
                     Errors = new List<string>() { "Error In Get All Stade" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<IEnumerable<Stade>>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region Update
        public async Task<IResponseResult<Stade>> Update(Stade entity)
        {

            var result = await _UnitOfWork.Stade.Value.Update(entity);

            return (result == null ?
                 new ResponseResult<Stade>()
                 {
                     Errors = new List<string>() { "Error In Update Stade" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<Stade>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region Update DTO
        public async Task<IResponseResult<Stade>> Update(StadeDTO entity)
        {

            Stade oStade = await _UnitOfWork.Stade.Value.Get(entity.Id);

            if (oStade == null)
            {
                return new ResponseResult<Stade>()
                {
                    Errors = new List<string>() { "Stade Not Exists !" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }

            oStade.ModificationDate = DateTime.Now;
            oStade.ModifiedBy = entity.ModifiedBy;
            oStade.Address = entity.Address;
            oStade.Capacity = entity.Capacity;
            oStade.Email = entity.Email;
            oStade.Latitude = entity.Latitude;
            oStade.Longitude = entity.Longitude;
            oStade.MobileNo = entity.MobileNo;
            oStade.Name = entity.Name;
            oStade.StadeType = entity.StadeType;
            oStade.Status = entity.Status;
            oStade.StatusDes = entity.StatusDes;

            oStade = await ImageHandler.HandleImage(oStade, entity.Image, entity.ImageName, ImagesTypes.Stade);

            var result = await _UnitOfWork.Stade.Value.Update(oStade);

            return (result == null ?
                 new ResponseResult<Stade>()
                 {
                     Errors = new List<string>() { "Error In Update Stade" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<Stade>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region UpdateRange
        public async Task<IResponseResult<IEnumerable<Stade>>> UpdateRange(IEnumerable<Stade> models)
        {
            var result = await _UnitOfWork.Stade.Value.UpdateRange(models);

            return (result == null ?
                 new ResponseResult<IEnumerable<Stade>>()
                 {
                     Errors = new List<string>() { "Error In Update All Stade" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<IEnumerable<Stade>>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region SearchStade
        public async Task<IResponseResult<IEnumerable<Core.Entities.Stade>>> SearchStade(SearchStadeCritriaDTO oSearchCritria)
        {
            long TotalRecords = 0;

            List<Expression<Func<Core.Entities.Stade, bool>>> filterExpressions = new List<Expression<Func<Core.Entities.Stade, bool>>>();

            if (oSearchCritria.Id.HasValue)
            {
                filterExpressions.Add(S => S.Id == oSearchCritria.Id);
            }

            if (oSearchCritria.Capacity.HasValue)
            {
                filterExpressions.Add(S => S.Capacity <= oSearchCritria.Capacity);
            }

            if (!string.IsNullOrEmpty(oSearchCritria.Name))
            {
                filterExpressions.Add(S => S.Name.ToLower().Contains(oSearchCritria.Name.ToLower()));
            }

            if (!string.IsNullOrEmpty(oSearchCritria.Address))
            {
                filterExpressions.Add(S => S.Name.ToLower().Contains(oSearchCritria.Address.ToLower()));
            }

            var result = _UnitOfWork.Stade.Value.GetByCriteria(
                filterExpressions,
                oSearchCritria.pageSize,
                out TotalRecords,
                oSearchCritria.pageNo,
                true
                 )?.ToList();

            return (result == null ?
                 new ResponseResult<IEnumerable<Core.Entities.Stade>>()
                 {
                     Errors = new List<string>() { "Error In Get Stade" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<IEnumerable<Core.Entities.Stade>>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = TotalRecords
                });
        }
        #endregion

        #region NotImplemented
        public IResponseResult<Stade> Remove(Stade entity)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Stade> RemoveRange(IEnumerable<Stade> models)
        {
            throw new NotImplementedException();
        }

        public IResponseResult<IEnumerable<Stade>> RemoveRangeByIDs(IEnumerable<long> IDs)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
