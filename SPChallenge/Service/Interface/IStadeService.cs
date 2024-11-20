using Core.DTO_s;
using Core.Entities;
using Core.Shared;
using Service.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Service.Interface
{
    public interface IStadeService : IService<Stade>
    {
        Task<IResponseResult<IEnumerable<Core.Entities.Stade>>> SearchStade(SearchStadeCritriaDTO oSearchCritria);
        Task<IResponseResult<Stade>> Add(StadeDTO entity);
        Task<IResponseResult<Stade>> Update(StadeDTO entity);
    }
}
