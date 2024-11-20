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
    public class MatchPlayersService : IMatchPlayersService
    {
        private readonly IUnitOfWorkRepository _UnitOfWork;
        public MatchPlayersService(IUnitOfWorkRepository UnitOfWork)
        {
            _UnitOfWork = UnitOfWork;
        }

        #region Add
        public async Task<IResponseResult<MatchPlayers>> Add(MatchPlayers entity)
        {
            var isValid = true;
            List<string> Errors = new List<string>();
            var user = _UnitOfWork.User.Value.Find(U => U.Id == entity.UserId).FirstOrDefault();

            if (user == null)
            {
                Errors.Add("Player Not Exists !");
                isValid = false;
            }
            else if (_UnitOfWork.Match.Value.Find(M => M.Id == entity.MatchId).Any())
            {
                Errors.Add("Match Not Exists !");
                isValid = false;
            }
            else if (_UnitOfWork.MatchPlayers.Value.Find(MP => MP.MatchId == entity.MatchId && MP.UserId == entity.UserId).Any())
            {
                Errors.Add("Player Already Registered !");
                isValid = false;
            }
            else if (_UnitOfWork.MatchPlayers.Value.Find(MP => MP.MatchId == entity.MatchId).Count() == _UnitOfWork.Match.Value.Find(M => M.Id == entity.MatchId).FirstOrDefault()?.Capacity)
            {
                Errors.Add("Match is full !");
                isValid = false;
            }
            else if (_UnitOfWork.Match.Value.Find(MP => MP.Id == entity.MatchId).FirstOrDefault()?.StartDate <= DateTime.Now.AddHours(1))
            {
                Errors.Add("Registration is closed for this match !");
                isValid = false;
            }

            if (isValid)
            {
                var result = await _UnitOfWork.MatchPlayers.Value.Add(entity);

                return (result == null ?
                     new ResponseResult<MatchPlayers>()
                     {
                         Errors = new List<string>() { "Error In Adding Match Players" },
                         Status = ResultStatus.Fail,
                         Data = null,
                         TotalRecords = 0
                     } :
                     new ResponseResult<MatchPlayers>()
                     {
                         Errors = new List<string>(),
                         Status = ResultStatus.Success,
                         Data = result,
                         TotalRecords = 1
                     });
            }
            else
            {
                return new ResponseResult<MatchPlayers>()
                {
                    Errors = Errors,
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }
        }
        #endregion

        #region Add with DTO
        public async Task<IResponseResult<MatchPlayers>> Add(MatchPlayerDTO entity)
        {
            var isValid = true;
            List<string> Errors = new List<string>();
            var user = _UnitOfWork.User.Value.Find(U => U.Id == entity.UserId).FirstOrDefault();

            if (user == null)
            {
                Errors.Add("Player Not Exists !");
                isValid = false;
            }
            else if (_UnitOfWork.Match.Value.Find(M => M.Id == entity.MatchId).Any())
            {
                Errors.Add("Match Not Exists !");
                isValid = false;
            }
            else if (_UnitOfWork.MatchPlayers.Value.Find(MP => MP.MatchId == entity.MatchId && MP.UserId == entity.UserId).Any())
            {
                Errors.Add("Player Already Registered !");
                isValid = false;
            }
            else if (_UnitOfWork.MatchPlayers.Value.Find(MP => MP.MatchId == entity.MatchId).Count() == _UnitOfWork.Match.Value.Find(M => M.Id == entity.MatchId).FirstOrDefault()?.Capacity)
            {
                Errors.Add("Match is full !");
                isValid = false;
            }
            else if (_UnitOfWork.Match.Value.Find(MP => MP.Id == entity.MatchId).FirstOrDefault()?.StartDate <= DateTime.Now.AddHours(1))
            {
                Errors.Add("Registration is closed for this match !");
                isValid = false;
            }

            if (isValid)
            {
                MatchPlayers oMatchPlayers = new MatchPlayers()
                {
                    CreatedBy = entity.CreatedBy,
                    CreationDate = DateTime.Now,
                    ModificationDate = null,
                    ModifiedBy = null,
                    MatchId = entity.MatchId,
                    UserId = entity.UserId,
                    ReviewId = null
                };

                var result = await _UnitOfWork.MatchPlayers.Value.Add(oMatchPlayers);

                return (result == null ?
                       new ResponseResult<MatchPlayers>()
                       {
                           Errors = new List<string>() { "Error In Adding Match Players" },
                           Status = ResultStatus.Fail,
                           Data = null,
                           TotalRecords = 0
                       } :
                       new ResponseResult<MatchPlayers>()
                       {
                           Errors = new List<string>(),
                           Status = ResultStatus.Success,
                           Data = result,
                           TotalRecords = 1
                       });
            }
            else
            {
                return new ResponseResult<MatchPlayers>()
                {
                    Errors = Errors,
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }
        }
        #endregion

        #region Get
        public async Task<IResponseResult<MatchPlayers>> Get(long Id)
        {
            var result = await _UnitOfWork.MatchPlayers.Value.Get(Id);


            return (result == null ?
                   new ResponseResult<MatchPlayers>()
                   {
                       Errors = new List<string>() { "Error In Get Match Players" },
                       Status = ResultStatus.Fail,
                       Data = null,
                       TotalRecords = 0
                   } :
                   new ResponseResult<MatchPlayers>()
                   {
                       Errors = new List<string>(),
                       Status = ResultStatus.Success,
                       Data = result,
                       TotalRecords = 1
                   });
        }
        #endregion

        #region Remove
        public async Task<IResponseResult<bool>> Remove(long MatchId, long PlayerId)
        {
            var isValid = true;
            List<string> Errors = new List<string>();
            var oMatchPlayers = _UnitOfWork.MatchPlayers.Value.Find(MP => MP.MatchId == MatchId && MP.UserId == PlayerId).FirstOrDefault();

            if (oMatchPlayers == null)
            {
                Errors.Append("Registration Not Exists");
                isValid = false;
            }
            else if (_UnitOfWork.Match.Value.Find(M => M.Id == MatchId).FirstOrDefault()?.StartDate <= DateTime.Now.AddHours(3))
            {
                Errors.Add("Unregistering is available up to 3 hours before the match starts.");
                isValid = false;
            }

            if (isValid)
            {
                var result = await _UnitOfWork.MatchPlayers.Value.Remove(oMatchPlayers);

                return (result == null ?
                new ResponseResult<bool>()
                {
                    Errors = new List<string>() { "Error In Remove Match Players" },
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
            else
            {
                return new ResponseResult<bool>()
                {
                    Errors = Errors,
                    Status = ResultStatus.Fail,
                    Data = false,
                    TotalRecords = 0
                };
            }
        }
        #endregion

        #region Not Implemented
        public IEnumerable<MatchPlayers> RemoveRange(IEnumerable<MatchPlayers> models)
        {
            throw new NotImplementedException();
        }

        public IResponseResult<IEnumerable<MatchPlayers>> RemoveRangeByIDs(IEnumerable<long> IDs)
        {
            throw new NotImplementedException();
        }

        public Task<IResponseResult<MatchPlayers>> Update(MatchPlayers entity)
        {
            throw new NotImplementedException();
        }

        public Task<IResponseResult<IEnumerable<MatchPlayers>>> UpdateRange(IEnumerable<MatchPlayers> models)
        {
            throw new NotImplementedException();
        }

        public Task<IResponseResult<IEnumerable<MatchPlayers>>> AddRange(IEnumerable<MatchPlayers> models)
        {
            throw new NotImplementedException();
        }
        public IResponseResult<IEnumerable<MatchPlayers>> GetAll()
        {
            throw new NotImplementedException();
        }

        public IResponseResult<MatchPlayers> Remove(MatchPlayers entity)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
