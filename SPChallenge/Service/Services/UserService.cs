using AutoMapper;
using Core.DTO_s;
using Core.Entities;
using Core.Interfaces;
using Core.Shared;
using Service.Interface;
using Service.Interfaces;
using System.Linq.Expressions;
using static Core.Enums;

namespace Service.Services
{
    public class UserService : IUserService
    {
        private readonly IUnitOfWorkRepository _UnitOfWork;
        public IMapper _mapper { get; }
        public UserService(IUnitOfWorkRepository UnitOfWork, IMapper Mapper)
        {
            _UnitOfWork = UnitOfWork;
            _mapper = Mapper;
        }

        #region GetUserInfoByUserName
        public async Task<ResponseResult<User>> GetUserInfoByUserName(string UserName)
        {
            var result = await _UnitOfWork.User.Value.GetUserInfoByUserName(UserName);

            return (result == null ?
                 new ResponseResult<User>()
                 {
                     Errors = new List<string>() { "User not found" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<User>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 });
        }
        #endregion

        #region CheckUserName
        public async Task<ResponseResult<bool?>> CheckUserName(string UserName)
        {
            bool Exists = await _UnitOfWork.User.Value.CheckUserName(UserName);

            return new ResponseResult<bool?>()
            {
                Errors = new List<string>(),
                Status = ResultStatus.Success,
                Data = Exists,
                TotalRecords = 1
            };
        }
        #endregion

        #region Add
        public async Task<IResponseResult<User>> Add(UserDTO entity)
        {
            bool exists = await _UnitOfWork.User.Value.CheckUserName(entity.UserName);

            if (exists)
            {
                return new ResponseResult<User>()
                {
                    Errors = new List<string>() { "User Name Already exists" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }

            User user = new User()
            {
                UserName = entity.UserName,
                Password = entity.Password,
                FirstName = entity.FirstName,
                LastName = entity.LastName,
                Gender = entity.Gender,
                MobileNo = entity.MobileNo,
                Email = entity.Email,
                BirthDate = entity.BirthDate,
                Address = entity.Address,
                CreatedBy = entity.UserName,
                CreationDate = DateTime.Now,
                PasswordTries = 0,
                Status = UserStatus.Allowed,
                UserType = (UserType)entity.UserType,
                Points = 20
            };

            user = await ImageHandler.HandleImage(user, entity.Image, entity.ImageName, ImagesTypes.User);

            var result = await _UnitOfWork.User.Value.Add(user);

            return (result == null ?
                 new ResponseResult<User>()
                 {
                     Errors = new List<string>() { "Error In Adding User" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<User>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 });
        }
        #endregion

        #region AddRange
        public async Task<IResponseResult<IEnumerable<User>>> AddRange(IEnumerable<User> models)
        {
            var result = await _UnitOfWork.User.Value.AddRange(models);

            return (result == null ?
                 new ResponseResult<IEnumerable<User>>()
                 {
                     Errors = new List<string>() { "Error In Adding Users" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<IEnumerable<User>>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 });
        }
        #endregion

        #region Get
        public async Task<IResponseResult<User>> Get(long Id)
        {
            var result = await _UnitOfWork.User.Value.Get(Id);

            return (result == null ?
                 new ResponseResult<User>()
                 {
                     Errors = new List<string>() { "Error In Get Users" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                new ResponseResult<User>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region GetAll
        public IResponseResult<IEnumerable<User>> GetAll()
        {
            var result = _UnitOfWork.User.Value.GetAll();

            return (result == null ?
                 new ResponseResult<IEnumerable<User>>()
                 {
                     Errors = new List<string>() { "Error In Get All Users" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<IEnumerable<User>>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 });
        }
        #endregion

        #region Update
        public async Task<IResponseResult<User>> Update(UserDTO entity)
        {
            var user = await _UnitOfWork.User.Value.GetUserInfoByUserName(entity.UserName);

            if (user == null)
            {
                return new ResponseResult<User>()
                {
                    Errors = new List<string>() { "User not exists !" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }

            user.FirstName = entity.FirstName;
            user.LastName = entity.LastName;
            user.Gender = entity.Gender;
            user.MobileNo = entity.MobileNo;
            user.Email = entity.Email;
            user.BirthDate = entity.BirthDate;
            user.Address = entity.Address;
            user.ModifiedBy = entity.UserName;
            user.ModificationDate = DateTime.Now;

            user = await ImageHandler.HandleImage(user, entity.Image, entity.ImageName, ImagesTypes.User);
            var result = await _UnitOfWork.User.Value.Update(user);

            return (result == null ?
                 new ResponseResult<User>()
                 {
                     Errors = new List<string>() { "Error In Update User" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<User>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 });
        }
        #endregion

        #region ChangeUserStatus
        public async Task<IResponseResult<string>> ChangeUserStatus(string UserName, int Status)
        {
            User? ouser = await _UnitOfWork.User.Value.GetUserInfoByUserName(UserName);

            if (ouser == null)
            {
                return new ResponseResult<string>()
                {
                    Errors = new List<string>() { "User Not Exists !" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }

            ouser.Status = (UserStatus)Status;
            var result = await _UnitOfWork.User.Value.Update(ouser);

            return new ResponseResult<string>()
            {
                Errors = new List<string>() { },
                Status = ResultStatus.Success,
                Data = "User Updated Successfully",
                TotalRecords = 1
            };
        }
        #endregion

        #region UpdateUserNote
        public async Task<IResponseResult<string>> UpdateUserNote(string UserName, string Note)
        {
            User? ouser = await _UnitOfWork.User.Value.GetUserInfoByUserName(UserName);

            if (ouser == null)
            {
                return new ResponseResult<string>()
                {
                    Errors = new List<string>() { "User Not Exists !" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }

            ouser.Notes = Note;
            var result = await _UnitOfWork.User.Value.Update(ouser);

            return new ResponseResult<string>()
            {
                Errors = new List<string>() { },
                Status = ResultStatus.Fail,
                Data = "User Updated Successfully",
                TotalRecords = 1
            };
        }
        #endregion

        #region UpdateRange
        public async Task<IResponseResult<IEnumerable<User>>> UpdateRange(IEnumerable<User> models)
        {
            var result = await _UnitOfWork.User.Value.UpdateRange(models);

            return (result == null ?
                 new ResponseResult<IEnumerable<User>>()
                 {
                     Errors = new List<string>() { "Error In Update All Users" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<IEnumerable<User>>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 });
        }
        #endregion

        #region SearchUser
        public async Task<IResponseResult<IEnumerable<Core.Entities.User>>> SearchUser(SearchUserCritriaDTO oSearchCritria)
        {
            long TotalRecords = 0;

            List<Expression<Func<Core.Entities.User, bool>>> filterExpressions = new List<Expression<Func<Core.Entities.User, bool>>>();
            Expression<Func<Core.Entities.User, object>>[] includExpressions = null;

            if (oSearchCritria.Id.HasValue)
            {
                filterExpressions.Add(U => U.Id == oSearchCritria.Id);
            }

            if (!string.IsNullOrEmpty(oSearchCritria.MobileNo))
            {
                filterExpressions.Add(U => U.MobileNo.Contains(oSearchCritria.MobileNo));
            }

            if (!string.IsNullOrEmpty(oSearchCritria.FirstName))
            {
                filterExpressions.Add(U => U.FirstName.ToLower().Contains(oSearchCritria.FirstName.ToLower()));
            }

            if (!string.IsNullOrEmpty(oSearchCritria.LastName))
            {
                filterExpressions.Add(U => U.LastName.ToLower().Contains(oSearchCritria.LastName.ToLower()));
            }

            if (oSearchCritria.Gender.HasValue)
            {
                filterExpressions.Add(U => ((int)U.Gender).Equals(oSearchCritria.Gender));
            }

            if (!string.IsNullOrEmpty(oSearchCritria.Email))
            {
                filterExpressions.Add(U => U.Email.ToLower().Contains(oSearchCritria.Email));
            }

            if (!string.IsNullOrEmpty(oSearchCritria.UserName))
            {
                filterExpressions.Add(U => U.UserName.ToLower().Contains(oSearchCritria.UserName));
            }

            if (oSearchCritria.UserType.HasValue)
            {
                filterExpressions.Add(U => ((int)U.UserType).Equals(oSearchCritria.UserType));
            }

            if (oSearchCritria.IncludePlayerStatistics.HasValue && oSearchCritria.IncludePlayerStatistics.Value)
            {
                includExpressions = new Expression<Func<Core.Entities.User, object>>[] { U => U.PlayerStatistics };
            }

            var result = _UnitOfWork.User.Value.GetByCriteria(
                filterExpressions,
                oSearchCritria.pageSize,
                out TotalRecords,
                oSearchCritria.pageNo,
                true,
                null,
                null,
                includExpressions
                 )?.ToList();

            return (result == null ?

                 new ResponseResult<IEnumerable<Core.Entities.User>>()
                 {
                     Errors = new List<string>() { "Error In Get User" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<IEnumerable<Core.Entities.User>>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = TotalRecords
                 });
        }
        #endregion

        #region AddPlayer
        public async Task<ResponseResult<UserDTO>> AddPlayer(UserDTO oPlayer)
        {
            bool existsUserName = await _UnitOfWork.User.Value.CheckUserName(oPlayer.UserName);

            if (existsUserName)
            {
                return new ResponseResult<UserDTO>()
                {
                    Errors = new List<string>() { "User Name Already exists" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }
            bool existsMobileNo = await _UnitOfWork.User.Value.CheckMobileNo(oPlayer.MobileNo, null);

            if (existsMobileNo)
            {
                return new ResponseResult<UserDTO>()
                {
                    Errors = new List<string>() { "Mobile No Already exists" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }

            User entity = new User()
            {
                UserName = oPlayer.UserName,
                Password = oPlayer.Password,
                FirstName = oPlayer.FirstName,
                LastName = oPlayer.LastName,
                Gender = oPlayer.Gender,
                MobileNo = oPlayer.MobileNo,
                Email = oPlayer.Email,
                BirthDate = oPlayer.BirthDate,
                Address = oPlayer.Address,
                CreatedBy = oPlayer.UserName,
                CreationDate = DateTime.Now,
                PasswordTries = 0,
                Status = UserStatus.Allowed,
                UserType = UserType.Player,
                Points = 20,
                Notes = string.Empty
            };

            entity = await ImageHandler.HandleImage(entity, oPlayer.Image, oPlayer.ImageName, ImagesTypes.User);
            var result = await _UnitOfWork.User.Value.Add(entity);

            if (result == null)
            {
                return new ResponseResult<UserDTO>()
                {
                    Errors = new List<string>() { "Error In Adding Player" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }
            else
            {

                oPlayer.Id = result.Id;
                oPlayer.Image = result.Image;
                oPlayer.ImageName = result.ImageName;

                PlayerStatistics PlayerStatistics = new PlayerStatistics()
                {
                    UserId = oPlayer.Id,
                    YellowCard = 0,
                    RedCard = 0,
                    Assist = 0,
                    Goals = 0,
                    CreatedBy = oPlayer.CreatedBy,
                    CreationDate = DateTime.Now,
                };

                await AddPlayerStatistics(PlayerStatistics);

                return new ResponseResult<UserDTO>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = oPlayer,
                    TotalRecords = 1
                };
            }
        }
        #endregion

        #region UpdatePlayer
        public async Task<ResponseResult<UserDTO>> UpdatePlayer(UserDTO oPlayer)
        {
            User? oUser = await _UnitOfWork.User.Value.GetUserInfoByUserName(oPlayer.UserName);

            if (oUser == null)
            {
                return new ResponseResult<UserDTO>()
                {
                    Errors = new List<string>() { "User not exists" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }

            bool existsMobileNo = await _UnitOfWork.User.Value.CheckMobileNo(oPlayer.MobileNo, oUser.UserName);

            if (existsMobileNo)
            {
                return new ResponseResult<UserDTO>()
                {
                    Errors = new List<string>() { "Mobile No already defined for another user" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }

            oUser.UserName = oPlayer.UserName;
            oUser.FirstName = oPlayer.FirstName;
            oUser.LastName = oPlayer.LastName;
            oUser.Gender = oPlayer.Gender;
            oUser.MobileNo = oPlayer.MobileNo;
            oUser.Email = oPlayer.Email;
            oUser.BirthDate = oPlayer.BirthDate;
            oUser.Address = oPlayer.Address;
            oUser.ModifiedBy = oPlayer.UserName;
            oUser.ModificationDate = DateTime.Now;

            oUser = await ImageHandler.HandleImage(oUser, oPlayer.Image, oPlayer.ImageName, ImagesTypes.User);

            var result = await _UnitOfWork.User.Value.Update(oUser);

            if (result == null)
            {
                return new ResponseResult<UserDTO>()
                {
                    Errors = new List<string>() { "Error In Adding Player" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }
            else
            {
                oPlayer.Id = result.Id;
                oPlayer.Image = result.Image;
                oPlayer.ImageName = result.ImageName;
                oPlayer.CreatedBy = result.CreatedBy;
                oPlayer.CreationDate = result.CreationDate;
                oPlayer.ModifiedBy = result.ModifiedBy;
                oPlayer.ModificationDate = result.ModificationDate;

                return new ResponseResult<UserDTO>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = oPlayer,
                    TotalRecords = 1
                };
            }
        }
        #endregion

        #region GetPlayerInfoByUserName
        public async Task<ResponseResult<UserDTO>> GetPlayerInfoByUserName(string UserName)
        {
            string Error = string.Empty;

            User? result = await _UnitOfWork.User.Value.GetUserInfoByUserName(UserName);

            if (result == null)
            {
                return new ResponseResult<UserDTO>()
                {
                    Errors = new List<string>() { "Error In Get Player By User Name" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }
            else
            {
                UserDTO entity = _mapper.Map<UserDTO>(result);
                return new ResponseResult<UserDTO>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = entity,
                    TotalRecords = 1
                };
            }
        }
        #endregion

        #region AddPlayerStatistics
        public async Task<ResponseResult<PlayerStatistics>> AddPlayerStatistics(PlayerStatistics playerStatistics)
        {
            PlayerStatistics result = await _UnitOfWork.User.Value.AddPlayerStatistics(playerStatistics);

            return (result == null ?
                new ResponseResult<PlayerStatistics>()
                {
                    Errors = new List<string>() { "Error In Get Player By User Name" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                } :
                new ResponseResult<PlayerStatistics>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                });
        }
        #endregion

        #region UpdatePlayerStatistics
        public async Task<ResponseResult<PlayerStatistics>> UpdatePlayerStatistics(PlayerStatistics playerStatistics)
        {
            if (playerStatistics != null && playerStatistics.Id > 0)
            {

                PlayerStatistics playerStat = await _UnitOfWork.User.Value.LoadPlayerStatistics(playerStatistics.UserId);

                if (playerStat == null)
                {
                    return new ResponseResult<PlayerStatistics>()
                    {
                        Errors = new List<string>() { "Player is not found, ID : " + playerStatistics.UserId },
                        Status = ResultStatus.Fail,
                        Data = null,
                        TotalRecords = 0
                    };
                }

                playerStat.YellowCard = playerStatistics.YellowCard;
                playerStat.RedCard = playerStatistics.RedCard;
                playerStat.Goals = playerStatistics.Goals;
                playerStat.Assist = playerStatistics.Assist;
                playerStat.UserId = playerStatistics.UserId;
                playerStat.ModificationDate = playerStatistics.ModificationDate;
                playerStat.ModifiedBy = playerStatistics.ModifiedBy;
                playerStat.Id = playerStatistics.Id;

                PlayerStatistics result = await _UnitOfWork.User.Value.UpdatePlayerStatistics(playerStat);

                if (result != null)
                {
                    return new ResponseResult<PlayerStatistics>()
                    {
                        Errors = new List<string>(),
                        Status = ResultStatus.Success,
                        Data = result,
                        TotalRecords = 1
                    };
                }
                else
                {
                    return new ResponseResult<PlayerStatistics>()
                    {
                        Errors = new List<string>() { "Error In Update Player Statistics" },
                        Status = ResultStatus.Fail,
                        Data = null,
                        TotalRecords = 0
                    };
                }
            }
            else
            {
                return new ResponseResult<PlayerStatistics>()
                {
                    Errors = new List<string>() { "Player Statistics ID must have value." },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }
        }
        #endregion

        #region UpdatePlayerStatistics
        public async Task<ResponseResult<PlayerStatistics>> UpdatePlayerStatistics(PlayerStatisticsDTO playerStatistics)
        {
            if (playerStatistics == null)
            {
                return new ResponseResult<PlayerStatistics>()
                {
                    Errors = new List<string>() { "Player Statistics must have value." },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }

            PlayerStatistics playerStat = await _UnitOfWork.User.Value.LoadPlayerStatistics(playerStatistics.UserId);

            if (playerStat == null)
            {
                return new ResponseResult<PlayerStatistics>()
                {
                    Errors = new List<string>() { "Player is not found, ID : " + playerStatistics.UserId },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }

            playerStat.YellowCard = playerStatistics.YellowCard.HasValue ? playerStatistics.YellowCard.Value : playerStat.YellowCard;
            playerStat.RedCard = playerStatistics.RedCard.HasValue ? playerStatistics.RedCard.Value : playerStat.RedCard;
            playerStat.Goals = playerStatistics.Goals.HasValue ? playerStatistics.Goals.Value : playerStat.Goals;
            playerStat.Assist = playerStatistics.Assist.HasValue ? playerStatistics.Assist.Value : playerStat.Assist;
            playerStat.ModificationDate = playerStatistics.ModificationDate;
            playerStat.ModifiedBy = playerStatistics.ModifiedBy;

            PlayerStatistics result = await _UnitOfWork.User.Value.UpdatePlayerStatistics(playerStat);

            return (result != null ?
                 new ResponseResult<PlayerStatistics>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 } :
                 new ResponseResult<PlayerStatistics>()
                 {
                     Errors = new List<string>() { "Error In Update Player Statistics" },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 });
        }
        #endregion

        #region LoadPlayerStatistics
        public async Task<ResponseResult<PlayerStatistics>> LoadPlayerStatistics(long UserID)
        {
            PlayerStatistics result = await _UnitOfWork.User.Value.LoadPlayerStatistics(UserID);

            return (result == null ?
                 new ResponseResult<PlayerStatistics>()
                 {
                     Errors = new List<string>() { "Player is not found, ID : " + UserID },
                     Status = ResultStatus.Fail,
                     Data = null,
                     TotalRecords = 0
                 } :
                 new ResponseResult<PlayerStatistics>()
                 {
                     Errors = new List<string>(),
                     Status = ResultStatus.Success,
                     Data = result,
                     TotalRecords = 1
                 });
        }
        #endregion

        #region Update
        public async Task<IResponseResult<User>> Update(User entity)
        {
            var result = await _UnitOfWork.User.Value.Update(entity);

            if (result == null)
            {
                return new ResponseResult<User>()
                {
                    Errors = new List<string>() { "Error In Update User" },
                    Status = ResultStatus.Fail,
                    Data = null,
                    TotalRecords = 0
                };
            }
            else
            {
                return new ResponseResult<User>()
                {
                    Errors = new List<string>(),
                    Status = ResultStatus.Success,
                    Data = result,
                    TotalRecords = 1
                };
            }
        }
        #endregion

        #region Not Implemented
        public IResponseResult<User> Remove(User entity)
        {
            throw new NotImplementedException();
        }
        public IEnumerable<User> RemoveRange(IEnumerable<User> models)
        {
            throw new NotImplementedException();
        }
        public IResponseResult<IEnumerable<User>> RemoveRangeByIDs(IEnumerable<long> IDs)
        {
            throw new NotImplementedException();
        }
        Task<IResponseResult<User>> IService<User>.Add(User entity)
        {
            throw new NotImplementedException();
        }
        #endregion
    }
}
