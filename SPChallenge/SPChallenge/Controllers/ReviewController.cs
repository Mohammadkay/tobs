using Core.Entities;
using Core.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Service.Interface;

namespace SPChallengeAPI.Controllers
{
    public class ReviewController : BaseController
    {
        private readonly IUnitOfWorkService _UnitOfWork;
        public ReviewController(IUnitOfWorkService UnitOfWork)
        {
            _UnitOfWork = UnitOfWork;
        }

        [Authorize(Roles = "Player")]
        [HttpPost("AddReview")]
        public async Task<IResponseResult<Review>> AddReview(Review entity)
        {
            var result = await _UnitOfWork.Review.Value.Add(entity);
            return result;
        }

        [Authorize(Roles = "None")]
        [HttpPost("AddReviewRange")]
        public async Task<IResponseResult<IEnumerable<Review>>> AddReviewRange(IEnumerable<Review> models)
        {
            var result = await _UnitOfWork.Review.Value.AddRange(models);
            return result;
        }

        [Authorize(Roles = "Admin")]
        [Authorize(Roles = "Player")]
        [HttpGet("Get/{Id}")]
        public async Task<IResponseResult<Review>> GetReview(long Id)
        {
            var result = await _UnitOfWork.Review.Value.Get(Id);
            return result;
        }

        [Authorize(Roles = "Player,Admin")]
        [HttpGet("GetAllReview")]
        public IResponseResult<IEnumerable<Review>> GetAllReview()
        {
            var result = _UnitOfWork.Review.Value.GetAll();
            return result;
        }

        [Authorize(Roles = "Player")]
        [HttpPut("UpdateReview")]
        public async Task<IResponseResult<Review>> UpdateReview(Review entity)
        {
            var result = await _UnitOfWork.Review.Value.Update(entity);
            return result;
        }

        [Authorize(Roles = "None")]
        [HttpPut("UpdateReviewRange")]
        public async Task<IResponseResult<IEnumerable<Review>>> UpdateReviewRange(IEnumerable<Review> models)
        {
            var result = await _UnitOfWork.Review.Value.UpdateRange(models);
            return result;
        }
    }
}
