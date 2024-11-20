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
    public class ReviewService : IReviewService
    {
        private readonly IUnitOfWorkRepository _UnitOfWork;
        public ReviewService(IUnitOfWorkRepository UnitOfWork)
        {
            _UnitOfWork = UnitOfWork;
        }

        #region Add
        public async Task<IResponseResult<Review>> Add(Review entity)
        {
            var result = await _UnitOfWork.Review.Value.Add(entity);

            return (result == null ?
                 new ResponseResult<Review>()
                 {
                     Errors = new List<string>() { "Error In Adding Review" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<Review>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region AddRange
        public async Task<IResponseResult<IEnumerable<Review>>> AddRange(IEnumerable<Review> models)
        {
            var result = await _UnitOfWork.Review.Value.AddRange(models);

            return (result == null ?
                 new ResponseResult<IEnumerable<Review>>()
                 {
                     Errors = new List<string>() { "Error In Adding Review" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<IEnumerable<Review>>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region Get
        public async Task<IResponseResult<Review>> Get(long Id)
        {
            var result = await _UnitOfWork.Review.Value.Get(Id);

            return (result == null ?
                 new ResponseResult<Review>()
                 {
                     Errors = new List<string>() { "Error In Get Review" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<Review>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region GetAll
        public IResponseResult<IEnumerable<Review>> GetAll()
        {
            var result = _UnitOfWork.Review.Value.GetAll();

            return (result == null ?
                 new ResponseResult<IEnumerable<Review>>()
                 {
                     Errors = new List<string>() { "Error In Get All Review" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<IEnumerable<Review>>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region Update
        public async Task<IResponseResult<Review>> Update(Review entity)
        {
            var result = await _UnitOfWork.Review.Value.Update(entity);

            return (result == null ?
                new ResponseResult<Review>()
                {
                    Errors = new List<string>() { "Error In Update Review" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                } :
                new ResponseResult<Review>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region UpdateRange
        public async Task<IResponseResult<IEnumerable<Review>>> UpdateRange(IEnumerable<Review> models)
        {
            var result = await _UnitOfWork.Review.Value.UpdateRange(models);

            return (result == null ?
                new ResponseResult<IEnumerable<Review>>()
                {
                    Errors = new List<string>() { "Error In Update All Review" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                } :
                new ResponseResult<IEnumerable<Review>>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region NotImplemented
        public IResponseResult<Review> Remove(Review entity)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Review> RemoveRange(IEnumerable<Review> models)
        {
            throw new NotImplementedException();
        }

        public IResponseResult<IEnumerable<Review>> RemoveRangeByIDs(IEnumerable<long> IDs)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
