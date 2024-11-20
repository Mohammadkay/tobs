import React, { useState } from 'react';
import './InsertMatch.css';
import fetchAPIs from 'Hooks/fetchApi';

const StadeSearchinput = ({ data, setIsSearch }) => {

  const [formData, setFormData] = useState({
    id: null,
    name: null,
    address: null,
    capacity: null,
    includeServices: true,
    pageSize: 100,
    pageNo: 1
  });

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: value });
  };

  const onSearchStade = async () => {

    const api = await fetchAPIs();
    await api.post('https://localhost:7012/api/Stade/SearchStade', formData)
      .then(async (res) => {
        console.log(res.data.data)
        await setIsSearch(true);
        await data(res.data.data);

      })
      .catch((err) => { console.log(err) })
  };

  return (
    <div style={{ display: 'flex', flexDirection: 'row', alignItems: 'center' }} className='border border-info rounded mt-4 d-flex justify-content-around'>
      <label>
        Name:
        <input
          type="text"
          name="name"
          value={formData.name}
          onChange={handleChange}
        />
      </label>
      <br />
      <label>
        Address:
        <input
          type="text"
          name="address"
          value={formData.address}
          onChange={handleChange}
        />
      </label>
      <br />
      <label>
        Capacity:
        <input
          type="number"
          name="capacity"
          value={formData.capacity}
          onChange={handleChange}
        />
      </label>

      <button onClick={onSearchStade} className=''>Search</button>
    </div>
  );
};

export default StadeSearchinput;