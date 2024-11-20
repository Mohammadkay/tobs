using Core.Shared;
using static Core.Enums;

public class ResponseResult<T> : IResponseResult<T>
{
    public List<string> Errors { get; set; }
    public ResultStatus Status { get; set; }
    public T Data { get; set; }
    public long TotalRecords { get; set; }
}