import { useEffect, useState } from "react"
import { fetchAPI } from "./fetchApi"

const useFetch = (endPoint)=>{
    
    const [data, setData] = useState([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(false);

useEffect(()=>{
    const fetchData = async ()=>{
        try
        {
        const res = await fetchAPI.get(endPoint);
        setLoading = true;
        setData = res;
        }
        catch(err)
        {
            setError(err);
        }        
        setLoading(false);
    }
    fetchData();
},endPoint)

return {data, loading, error};
}

export default useFetch;