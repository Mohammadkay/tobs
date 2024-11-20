import fetchAPIs from 'Hooks/fetchApi';
import { useEffect, useState } from 'react';
import GridView from './GridViewStade';
import './InsertMatch.css';
import StadeSearchinput from './StadeSearchinput';

function StadesCretirea() {

  const [dataStade, setdataStade] = useState([]);
  const [selectedItem, setSelectedItem] = useState(null);
  const [isSearch, setIsSearch] = useState(false);


  const handleSetdataStade = (data) => {
    setdataStade(data);
    console.log(isSearch);
  };

  const getAllStade = async () => {
    try {
      if (isSearch == false) {
        const api = await fetchAPIs();
        const response = await api.get('https://localhost:7012/api/Stade/GetAllStadees');
        setdataStade(response.data.data);
      }
    } catch (error) {
      console.error(error);
    }
  };

  useEffect(() => {
    getAllStade();
  }, [isSearch]);

  return (
    <div className="container">
      <StadeSearchinput data={handleSetdataStade} setIsSearch={setIsSearch} />
      <GridView data={dataStade} />
    </div>
  );
}

export default StadesCretirea;