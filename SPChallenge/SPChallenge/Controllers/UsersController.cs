using Core.DTO_s;
using Core.Entities;
using Core.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Service.Interface;

namespace SPChallengeAPI.Controllers
{
    public class UsersController : BaseController
    {
        private readonly IUnitOfWorkService _UnitOfWork;
        public UsersController(IUnitOfWorkService UnitOfWork)
        {
            _UnitOfWork = UnitOfWork;
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("GetUserInfoByUserName/{UserName}")]
        public async Task<ResponseResult<User>> GetUserInfoByUserName(string UserName)
        {
           var result = await _UnitOfWork.User.Value.GetUserInfoByUserName(UserName);
            return result;
        }

        [HttpGet("CheckUserName/{UserName}")]
        public async Task<ResponseResult<bool?>> CheckUserName(string UserName)
        {
            var result = await _UnitOfWork.User.Value.CheckUserName(UserName);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPost("AddUser")]
        public async Task<IResponseResult<User>> AddUser(UserDTO entity)
        {
            var result = await _UnitOfWork.User.Value.Add(entity);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPost("AddUsersRange")]
        public async Task<IResponseResult<IEnumerable<User>>> AddUsersRange(IEnumerable<User> models)
        {         
            var result = await _UnitOfWork.User.Value.AddRange(models);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("Get/{Id}")]
        public async Task<IResponseResult<User>> GetUser(long Id)
        {
            var result = await _UnitOfWork.User.Value.Get(Id);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("GetAllUsers")]
        public IResponseResult<IEnumerable<User>> GetAllUsers()
        {
            var result =  _UnitOfWork.User.Value.GetAll();
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPut("UpdateUser")]
        public async Task<IResponseResult<User>> UpdateUser(UserDTO entity)
        {
            var result = await _UnitOfWork.User.Value.Update(entity);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPut("UpdateUsersRange")]
        public async Task<IResponseResult<IEnumerable<User>>> UpdateUsersRange(IEnumerable<User> models)
        {
            var result = await _UnitOfWork.User.Value.UpdateRange(models);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpGet("ChangeUserStatus")]
        public async Task<IResponseResult<string>> ChangeUserStatus(string UserName, int Status)
        {
            var result = await _UnitOfWork.User.Value.ChangeUserStatus(UserName, Status);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPut("UpdateUserNote")]
        public async Task<IResponseResult<string>> UpdateUserNote(string UserName, string Note)
        {
            var result = await _UnitOfWork.User.Value.UpdateUserNote(UserName, Note);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPost("SearchUser")]
        public async Task<IResponseResult<IEnumerable<Core.Entities.User>>> SearchUser(SearchUserCritriaDTO oSearchCritria)
        {
            var result = await _UnitOfWork.User.Value.SearchUser(oSearchCritria);
            return result;
        }

        #region Players
        [AllowAnonymous]
        [HttpPost("AddPlayers")]
        public async Task<IResponseResult<UserDTO>> AddPlayers(UserDTO entity)
        {
            var result = await _UnitOfWork.User.Value.AddPlayer(entity);
            return result;
        }

        [AllowAnonymous]
        [Authorize(Roles = "Player")]
        [HttpPut("UpdatePlayers")]
        public async Task<IResponseResult<UserDTO>> UpdatePlayers(UserDTO entity)
        {
            var result = await _UnitOfWork.User.Value.UpdatePlayer(entity);
            return result;
        }

        [Authorize(Roles = "Player")]
        [HttpGet("GetPalyerInfoByUserName/{UserName}")]
        public async Task<IResponseResult<UserDTO>> GetPalyerInfoByUserName(string UserName)
        {
            var result = await _UnitOfWork.User.Value.GetPlayerInfoByUserName(UserName);
            return result;
        }
          

        [Authorize(Roles = "Player")]
        [HttpPost("AddPlayerStatistics")]
        public async Task<IResponseResult<PlayerStatistics>> AddPlayerStatistics(PlayerStatistics playerStatistics)
        {
            var result = await _UnitOfWork.User.Value.AddPlayerStatistics(playerStatistics);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [HttpPut("UpdatePlayerStatistics")]
        public async Task<IResponseResult<PlayerStatistics>> UpdatePlayerStatistics(PlayerStatisticsDTO playerStatistics)
        {
            var result = await _UnitOfWork.User.Value.UpdatePlayerStatistics(playerStatistics);
            return result;
        }

        [Authorize(Roles = "Player, Admin")]
        [HttpGet("LoadPlayerStatistics")]
        public async Task<IResponseResult<PlayerStatistics>> LoadPlayerStatistics(long UserID)
        {
            var result = await _UnitOfWork.User.Value.LoadPlayerStatistics(UserID);
            return result;
        }
        #endregion
    }
}
