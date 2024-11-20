import { useEffect, useState } from 'react';
import './InsertMatch.css';
import Cookies from 'universal-cookie';
import fetchAPIs from 'Hooks/fetchApi';
import StadeServices from './StadeServices';

const InsertStade = () => {
  //#region Properties
  const jwt = require('react-jwt');
  const cookies = new Cookies();
  const userData = jwt.decodeToken(cookies.get('Token_API'));
  const [message, setMessage] = useState('');
  const [showPopup, setShowPopup] = useState(false);
  const [formValid, setFormValid] = useState(false);
  const [validationErrors, setValidationErrors] = useState({});
  const [isOpenServices, setIsOpenServices] = useState(false);
  const [StadeID, setStadeID] = useState(0);
  const [selectedOptions, setSelectedOptions] = useState([]);
  
  const initialFormData = {
    id: 0,
    creationDate: new Date().toISOString(),
    createdBy: userData != null ? userData.unique_name : 'Admin',
    modificationDate: new Date().toISOString(),
    modifiedBy: userData != null ? userData.unique_name : 'Admin',
    name: '',
    mobileNo: '',
    email: '',
    address: '',
    status: 1,
    statusDes: 'Active',
    longitude: 'string',
    latitude: 'string',
    image: 'string',
    imageName: 'string',
    capacity: 0,
    stadeType: 1,
  };

  const [formData, setFormData] = useState(initialFormData);

  const initialServicesData = {
    id: 0,
    creationDate: new Date().toISOString(),
    createdBy: userData != null ? userData.unique_name : 'Admin',
    modificationDate: new Date().toISOString(),
    modifiedBy: userData != null ? userData.unique_name : 'Admin',
    stadeId: StadeID,
    stadeServiceId: null,
  };

  const [servicesData, setServicesData] = useState(initialServicesData);
  //#endregion

  //#region Event
  const handleImageChange = (e) => {
    const file = e.target.files[0];
    if (file && e.target.files.length !== 0) {
      const reader = new FileReader();
      reader.onloadend = () => {
        setFormData({
          ...formData,
          image: URL.createObjectURL(file),
          imageName: file.name,
        });
      };
      reader.readAsDataURL(file);
    }
  };

  const handleChange = (e) => {
    const { name, value } = e.target;
    setFormData({ ...formData, [name]: name === 'stadeType' ? parseInt(value) : value });

    setValidationErrors({
      ...validationErrors,
      [name]: value.trim() === '' ? `${name} is required.` : '',
    });
  };

  const handleSubmit = (e) => {
    e.preventDefault();
  };

  const isFormValid = () => {
    const valid = Object.values(formData).every((value) => value !== '' && value !== undefined);
    setValidationErrors(valid ? {} : { ...formData });
    return valid;
  };

  useEffect(() => {
    setFormValid(isFormValid());
  }, [formData]);

  const handleSelectedOptionsChange = (options) => {
    setSelectedOptions(options);
  };

  const onsubmit = async () => {
    const api = await fetchAPIs();
    if (isFormValid()) {
      try {
        const res = await api.post('https://localhost:7012/api/stade/addstade', formData);
        console.log(res);
        if (res.data != null && res.data.data.status === 1) {
          setFormData(initialFormData);
          setMessage('Insertion successful!');
          setShowPopup(true);
          await setStadeID(res.data.data.id);
        } else if (res != null && res.data.data === 0) {
          setMessage(res.data.errors);
          setShowPopup(true);
        }
      } catch (err) {
        if (err.response && err.response.data) {
          setMessage(err.response.data);
          setShowPopup(true);
        } else {
          setMessage(`Error happened while Insert, please try again: ${err}`);
          setShowPopup(true);
        }
        console.log(err);
      }

      console.log(StadeID)
      if (selectedOptions.length > 0 && StadeID > 0) {
        selectedOptions.forEach((element) => {
          console.log(element);
          const newServicesData = {
            ...initialServicesData,
            stadeId: StadeID,
            stadeServiceId: element.id,
          };
          api.post('https://localhost:7012/api/StadeServices/AddStadeServicToStade', newServicesData)
            .then((res) => {setMessage(message + " and services added"); setIsOpenServices(false)})
            .catch((err) => {setMessage(message + " services has an error : " + err.message); console.log(err); });
        });
      }
    }
  };

  const showServices = () => {
    setIsOpenServices(!isOpenServices);
  };

  const handlePopupClose = () => {
    setShowPopup(false);
  };
  //#endregion

  return (
    <>
      <form className="form-container" onSubmit={handleSubmit}>
        <label className="label">
          Name:
          <input className="input" required type="text" name="name" value={formData.name} onChange={handleChange} />
        </label>
        <label className="label">
          Mobile No:
          <input className="input" type="text" required name="mobileNo" value={formData.mobileNo} onChange={handleChange} />
        </label>
        <label className="label">
          Email:
          <input className="input" type="text" required name="email" value={formData.email} onChange={handleChange} />
        </label>
        <label className="label">
          Address:
          <input className="input" type="text" required name="address" value={formData.address} onChange={handleChange} />
        </label>
        <label className="label">
          Capacity:
          <input className="input" type="text" required name="capacity" value={formData.capacity} onChange={handleChange} />
        </label>

        <div className="image-upload">
          <label className="label">
            Stade Image:
            <input className="image-input" type="file" accept="image/*" onChange={handleImageChange} />
          </label>
        </div>

        <label className="label">
          Stade Type:
          <select className="input" name="stadeType" required value={formData.stadeType} onChange={handleChange}>
            <option value={1}>Outdoor</option>
            <option value={2}>Indoor</option>
          </select>
        </label>
        <a href="#" onClick={showServices}>Add Services</a>

        <div>{isOpenServices && <StadeServices onSelectedOptionsChange={handleSelectedOptionsChange} />}</div>

        <button className="button" type="submit" onClick={onsubmit}>Submit</button>
      </form>
      {showPopup && (
        <div className="popup">
          <div className="popup-content">
            <p>{message}</p>
            <button onClick={handlePopupClose}>Close</button>
          </div>
        </div>
      )}
    </>
  );
};

export default InsertStade;