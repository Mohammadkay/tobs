using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Core.Shared;

namespace Service.Interfaces
{
    public interface IService<Model>
    {
        Task<IResponseResult<Model>> Add(Model entity);
        Task<IResponseResult<Model>> Get(long Id);
        Task<IResponseResult<IEnumerable<Model>>> AddRange(IEnumerable<Model> models);
        IResponseResult<IEnumerable<Model>> GetAll();
        IResponseResult<Model> Remove(Model entity);
        Task<IResponseResult<Model>> Update(Model entity);
        IEnumerable<Model> RemoveRange(IEnumerable<Model> models);
        IResponseResult<IEnumerable<Model>> RemoveRangeByIDs(IEnumerable<long> IDs);
        Task<IResponseResult<IEnumerable<Model>>> UpdateRange(IEnumerable<Model> models);
    }
}
