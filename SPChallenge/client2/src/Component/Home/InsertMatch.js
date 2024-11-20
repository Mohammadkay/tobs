import React, { useState } from 'react';
import './InsertMatch.css';
import Cookies from 'universal-cookie';
import fetchAPIs from 'Hooks/fetchApi';

const InsertMatch = () => {
  const [id, seid] = useState(0);
  const [creationDate, setcreationDate] = useState(new Date);
  const [createdBy, setcreatedBy] = useState('');
  const [modificationDate, setmodificationDate] = useState(new Date);
  const [modifiedBy, setmodifiedBy] = useState('');
  const [name, setname] = useState('');
  const [startDate, setstartDate] = useState(new Date);
  const [endDate, setendDate] = useState(new Date);
  const [capacity, setcapacity] = useState(0);
  const [gender, setgender] = useState(0);
  const [ageFrom, setageFrom] = useState(new Date);
  const [ageTo, setageTo] = useState(50);
  const [price, setprice] = useState(0);
  const [stadeId, setstadeId] = useState(0);

  const [message, setMessage] = useState('');

  let jwt = require('react-jwt');
  const cookies = new Cookies();
  const userData = jwt.decodeToken(cookies.get("Token_API"))


const SubmitData = async ()=>{
  setcreatedBy( userData !== null ? userData.unique_name : "Admin");
  setmodifiedBy(userData !== null ? userData.unique_name : 'Admin');
  const api = await fetchAPIs();

  api.post("https://localhost:7012/api/Match/AddMatch",
      { id,creationDate, createdBy, modificationDate, modifiedBy,name, startDate, endDate,  capacity, gender, ageFrom, ageTo, price, stadeId}
    )
      .then((res) => {
        console.log(res);
        if (res.data.status == 1 && res.data.userType != 1) {
          console.log("match inserted success")
        }
        else if (res.data.userType != 1) {
          // @ts-ignore
          setMessage("The Match not inserted");  
          console.log(message)        
        }
        else {
          setMessage(res.data.errors == "User not found" ? "Please check your username and password." : res.data.errors);
          console.log(message) 
        }
      }).catch((err) => {
        if (err.response && err.response.data) {
          setMessage(err);
          console.log(message) 
        }
        console.log(err);
        // @ts-ignore        
        setMessage("Error happened while login, please try again" + err );
        console.log(message) 
        
      });

}
   
    
      const handleSubmit = (e) => {
        e.preventDefault();
      };


    return(<>
     <form className="form-container" onSubmit={handleSubmit}>
      <div className="form-group">
        <label htmlFor="name">Name Match</label>
        <input type="text" id="name" name="name" onChange={(e)=>{setname(e.target.value)} } />
      </div>
      <div className="form-group">
        <label htmlFor="startDate">Start Date:</label>
        <input type="datetime-local" id="startDate" name="startDate" onChange={(e)=>{setstartDate(e.target.value)}} />
      </div>
      <div className="form-group">
        <label htmlFor="endDate">End Date</label>
        <input type="datetime-local" id="endDate" name="endDate" onChange={(e)=>{setendDate(e.target.value)}} />
      </div>
      <div className="form-group">
        <label htmlFor="capacity">Capacity :</label>
        <input type="text" id="capacity" name="capacity" onChange={(e)=>{setcapacity(e.target.value)}} />
      </div>
      <div className="form-group">
      <div className="gender-dropdown-container">
        <label htmlFor="gender">Gender :</label>
        <select id="gender" name="gender" onChange={(e)=>{setgender(e.target.value)}}>
        <option value="">Select</option>
        <option value="0">Male</option>
        <option value="1">Female</option>
      </select>
      </div>
      </div>
      <div className="form-group">
        <label htmlFor="ageFrom">Age From :</label>
        <input type="text" id="ageFrom" name="ageFrom"  onChange={(e)=>{setageFrom(e.target.value)}} />
      </div>
      <div className="form-group">
        <label htmlFor="ageTo">Age To :</label>
        <input type="text" id="input6" name="input6"  onChange={(e)=>{setageTo(e.target.value)}} />
      </div>
      <div className="form-group">
        <label htmlFor="price">Price :</label>
        <input type="text" id="price" name="price" onChange={(e)=>{setprice(e.target.value)}} />
      </div>
      <label htmlFor="Stade Name">Stade Name :</label>
      <input
        type="text"
        placeholder="Search..."
        value={stadeId}
        onChange={(e) => setstadeId(e.target.value)}
      />

      <button type="submit" onClick={()=>{SubmitData()}}>Submit</button>
    </form>
    </>)
}

export default InsertMatch;