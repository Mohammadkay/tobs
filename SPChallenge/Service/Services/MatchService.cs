using Core.DTO_s;
using Core.Entities;
using Core.Interfaces;
using Core.Shared;
using Service.Interface;
using System.Linq.Expressions;
using static Core.Enums;

namespace Service.Services
{
    public class MatchService : IMatchService
    {
        private readonly IUnitOfWorkRepository _UnitOfWork;

        public MatchService(IUnitOfWorkRepository UnitOfWork)
        {
            _UnitOfWork = UnitOfWork;
        }

        #region Add
        public async Task<IResponseResult<Match>> Add(Match entity)
        {
            var result = await _UnitOfWork.Match.Value.Add(entity);

            return (result == null ?
                 new ResponseResult<Match>()
                 {
                     Errors = new List<string>() { "Error In Adding Match" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<Match>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 });
        }
        #endregion

        #region Add With DTO
        public async Task<IResponseResult<Match>> Add(MatchDTO entity)
        {
            Match oMatch = new Match()
            {
                CreatedBy = entity.CreatedBy,
                CreationDate = DateTime.Now,
                Name = entity.Name,
                StartDate = entity.StartDate,
                EndDate = entity.EndDate,
                Capacity = entity.Capacity,
                Gender = entity.Gender,
                AgeFrom = entity.AgeFrom,
                AgeTo = entity.AgeTo,
                Price = entity.Price,
                StadeId = entity.StadeId,
                ManOfTheGameId = null,
                ModificationDate = null,
                ModifiedBy = null
            };

            var result = await _UnitOfWork.Match.Value.Add(oMatch);

            return (result == null ?
                 new ResponseResult<Match>()
                 {
                     Errors = new List<string>() { "Error In Adding Match" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<Match>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 });
        }
        #endregion

        #region AddRange
        public async Task<IResponseResult<IEnumerable<Match>>> AddRange(IEnumerable<Match> models)
        {
            var result = await _UnitOfWork.Match.Value.AddRange(models);

            return (result == null ?
                 new ResponseResult<IEnumerable<Match>>()
                 {
                     Errors = new List<string>() { "Error In Adding Match" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<IEnumerable<Match>>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 });
        }
        #endregion

        #region Get
        public async Task<IResponseResult<Match>> Get(long Id)
        {
            var result = await _UnitOfWork.Match.Value.Get(Id);

            return (result == null ?
                 new ResponseResult<Match>()
                 {
                     Errors = new List<string>() { "Error In Get Match" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<Match>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region GetAll
        public IResponseResult<IEnumerable<Match>> GetAll()
        {
            var result = _UnitOfWork.Match.Value.GetAll();

            return (result == null ?
                 new ResponseResult<IEnumerable<Match>>()
                 {
                     Errors = new List<string>() { "Error In Get All Match" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<IEnumerable<Match>>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = result.Count()
                });

        }
        #endregion

        #region Update
        public async Task<IResponseResult<Match>> Update(Match entity)
        {
            var result = await _UnitOfWork.Match.Value.Update(entity);

            return (result == null ?
                 new ResponseResult<Match>()
                 {
                     Errors = new List<string>() { "Error In Update Match" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<Match>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region Update
        public async Task<IResponseResult<Match>> Update(MatchDTO entity)
        {
            Match oMatch = await _UnitOfWork.Match.Value.Get(entity.Id);

            if (oMatch == null)
            {
                return new ResponseResult<Match>()
                {
                    Errors = new List<string>() { "Match not exists !" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }
            oMatch.ModificationDate = DateTime.Now;
            oMatch.ModifiedBy = entity.ModifiedBy;
            oMatch.Name = entity.Name;
            oMatch.StartDate = entity.StartDate;
            oMatch.EndDate = entity.EndDate;
            oMatch.Capacity = entity.Capacity;
            oMatch.Gender = entity.Gender;
            oMatch.AgeFrom = entity.AgeFrom;
            oMatch.AgeTo = entity.AgeTo;
            oMatch.Price = entity.Price;
            oMatch.StadeId = entity.StadeId;
            oMatch.ManOfTheGameId = entity.ManOfTheGameId;

            var result = await _UnitOfWork.Match.Value.Update(oMatch);

            return (result == null ?
                 new ResponseResult<Match>()
                 {
                     Errors = new List<string>() { "Error In Update Match" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<Match>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region UpdateRange
        public async Task<IResponseResult<IEnumerable<Match>>> UpdateRange(IEnumerable<Match> models)
        {
            var result = await _UnitOfWork.Match.Value.UpdateRange(models);

            return (result == null ?
                 new ResponseResult<IEnumerable<Match>>()
                 {
                     Errors = new List<string>() { "Error In Update All Match" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<IEnumerable<Match>>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region SearchMatch
        public async Task<IResponseResult<IEnumerable<Core.Entities.Match>>> SearchMatch(MatchSearchCritriaDTO oSearchCritria)
        {
            long TotalRecords = 0;

            List<Expression<Func<Core.Entities.Match, bool>>> filterExpressions = new List<Expression<Func<Core.Entities.Match, bool>>>();

            if (oSearchCritria.Id.HasValue)
            {
                filterExpressions.Add(M => M.Id == oSearchCritria.Id);
            }

            if (oSearchCritria.StartDateFrom.HasValue)
            {
                filterExpressions.Add(M => M.StartDate >= oSearchCritria.StartDateFrom);
            }

            if (oSearchCritria.EndDateTo.HasValue)
            {
                filterExpressions.Add(M => M.EndDate <= oSearchCritria.EndDateTo);
            }

            if (oSearchCritria.StadeId.HasValue)
            {
                filterExpressions.Add(M => M.StadeId == oSearchCritria.StadeId);
            }

            if (oSearchCritria.Gender.HasValue)
            {
                filterExpressions.Add(M => ((int)M.Gender).Equals(oSearchCritria.Gender));
            }

            if (oSearchCritria.Price.HasValue)
            {
                filterExpressions.Add(M => M.Price == oSearchCritria.Price);
            }

            if (oSearchCritria.AgeFrom.HasValue)
            {
                filterExpressions.Add(M => M.AgeFrom >= oSearchCritria.AgeFrom);
            }

            if (oSearchCritria.AgeTo.HasValue)
            {
                filterExpressions.Add(M => M.AgeTo <= oSearchCritria.AgeTo);
            }

            var result = _UnitOfWork.Match.Value.GetByCriteria(
                filterExpressions,
                oSearchCritria.pageSize,
                out TotalRecords,
                oSearchCritria.pageNo,
                true
                 )?.ToList();

            return (result == null ?
                 new ResponseResult<IEnumerable<Core.Entities.Match>>()
                 {
                     Errors = new List<string>() { "Error In Get Matches" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<IEnumerable<Core.Entities.Match>>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = TotalRecords
                 });
        }
        #endregion

        #region GetAllMathcPlayer
        public async Task<IResponseResult<IEnumerable<Core.Entities.User>>> GetAllMathcPlayer(Int64 MatchId)
        {
            var Match = _UnitOfWork.Match.Value.Find(M => M.Id == MatchId).FirstOrDefault();

            if (Match == null)
            {
                new ResponseResult<IEnumerable<Core.Entities.Match>>()
                {
                    Errors = new List<string>() { "Match ID s incorrect" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }

            long TotalRecords = 0;

            var MatchPlayers = _UnitOfWork.User.Value.Find(U => U.MatchPlayers.Where(P => P.MatchId == MatchId).Any()).ToList();

            return (MatchPlayers == null ?
                 new ResponseResult<IEnumerable<Core.Entities.User>>()
                 {
                     Errors = new List<string>() { "Error In Get All Mathc Players" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<IEnumerable<Core.Entities.User>>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = MatchPlayers,
                     TotalRecords = TotalRecords
                 });
        }
        #endregion

        #region NotImplemented
        public IResponseResult<Match> Remove(Match entity)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<Match> RemoveRange(IEnumerable<Match> models)
        {
            throw new NotImplementedException();
        }

        public IResponseResult<IEnumerable<Match>> RemoveRangeByIDs(IEnumerable<long> IDs)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
