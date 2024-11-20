import { useEffect, useState } from 'react';
import './InsertMatch.css';
import fetchAPIs from 'Hooks/fetchApi';

const StadeServices = ({ onSelectedOptionsChange }) => {
  const [selectedOptions, setSelectedOptions] = useState([]);
  const [options, setoptions] = useState([]);

  const getAllServices = async () => {
    const api = await fetchAPIs();
    await api.get("https://localhost:7012/api/StadeServices/GetAllStadeServiceses")
      .then((res) => {
        if (res.data != null && res.data.status === 1) {
          setoptions(res.data.data);
        }else {
          console.log(res);
        }
      }).catch((err)=>{
        console.log(err);
      })
  }

  const handleCheckboxChange = (option) => {
    setSelectedOptions(prevSelectedOptions => {
      const isSelected = prevSelectedOptions.includes(option);
      if (isSelected) {
        console.log(`${option.name} checkbox was unchecked`);
        return prevSelectedOptions.filter(item => item !== option);
      } else {
        console.log(`${option.name} checkbox was checked`);
        return [...prevSelectedOptions, option];
      }
    });
  };


  useEffect(()=>{
    getAllServices();
  },[]);

  useEffect(() => {
    // Call the function passed from the parent component
    onSelectedOptionsChange(selectedOptions);
  }, [selectedOptions, onSelectedOptionsChange]);

  return (
    <div className="checkbox-container">
      {options.map(option => (
        <div key={option.id}>
          <input
            type="checkbox"
            id={option.id}
            value={option.name}
            checked={selectedOptions.includes(option)}
            onChange={() => handleCheckboxChange(option)}
          />
          <label htmlFor={option.id} className="checkbox-label">
            {option.name}
          </label>
        </div>
      ))}
    </div>
  );
}

export default StadeServices;