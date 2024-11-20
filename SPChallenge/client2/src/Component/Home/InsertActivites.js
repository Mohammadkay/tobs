import React, { useEffect, useState } from 'react';
import './InsertMatch.css';
import SavedSearchIcon from '@mui/icons-material/SavedSearch';
import fetchAPIs from 'Hooks/fetchApi';
import Cookies from 'universal-cookie';

const InsertActivites = () => {
    let jwt = require('react-jwt');
    const cookies = new Cookies();
    const userData = jwt.decodeToken(cookies.get("Token_API"));

    const [yellowCard, setYellowCard] = useState(null);
    const [redCard, setRedCard] = useState(null);
    const [goals, setGoals] = useState(null);
    const [assist, setAssist] = useState(null);
    const [userId, setUserId] = useState(null);
    const [userName, setuserName] = useState(null);
    const [searchResult, setSearchResult] = useState([]);
    const [showDropdown, setShowDropdown] = useState(false);
    const [userNameChange, setuserNameChange] = useState(null);
    const [message, setMessage] = useState("");
    const [showPopup, setShowPopup] = useState(false);

    const [result, setResult] = useState({});



    const body = {
        "id": 0,
        "creationDate": Date.now,
        "createdBy": userData != null ? userData.unique_name : "Admin",
        "modificationDate": Date.now,
        "modifiedBy": userData != null ? userData.unique_name : "Admin",
        "yellowCard": yellowCard,
        "redCard": redCard,
        "goals": goals,
        "assist": assist,
        "userId": userId
    };

    const UserInput = {
        "id": null,
        "userName": null,
        "firstName": null,
        "lastName": null,
        "gender": null,
        "mobileNo": null,
        "email": null,
        "userType": null,
        "pageSize": 10,
        "pageNo": 1
    };

    const handleSubmit = (e) => {
        e.preventDefault();
    };


    const handleUserSearch = async () => {
        const api = await fetchAPIs();
        await api.post("https://localhost:7012/api/Users/SearchUser", UserInput)
            .then((res) => {
                if (res.data != null && res.data.data.length > 0 && userName.length > 0) {
                    setSearchResult(res.data.data);
                    setShowDropdown(true);
                } else {
                    setSearchResult([]);
                    setuserName(null);
                    setShowDropdown(false);
                }
            }).catch((err) => {
                console.log(err);
            });
    };

    const handlePlayer = (result) => {
        console.log(result)
        setUserId(result.id);
        setShowDropdown(false);
        setuserName(result.userName);
        setuserNameChange(result.userName);
        setRedCard(result.redCard);
        setYellowCard(result.yellowCard);
        setGoals(result.goals);
        setAssist(result.assist);
    }



    const onSubmit = async () => {
        console.log("user id : " + userId)
        const api = await fetchAPIs();
        if (userId > 0)        
            await api.put("https://localhost:7012/api/Users/UpdatePlayerStatistics", body)
                .then((res) => {
                    if (res.data != null && res.data.status === 1) {
                        setMessage("Update Succecss");
                        setShowPopup(true);
                    } else {
                        console.log(res);
                        setMessage(res.data.errors);
                        setShowPopup(true);
                    }
                }).catch((err) => {
                    setMessage(err.message);
                    setShowPopup(true);
                })
    };

    const handlePopupClose = () => {
        setShowPopup(false);
    };


    useEffect(() => {
        if (userName != null && userName.length > 0 && userName != userNameChange) {
            UserInput.userName = userName;            
            handleUserSearch();
        } else {
            //setUserId(0);
            setShowDropdown(false);
        }
    }, [userName]);

    return (<>
        <form className="form-container" onSubmit={handleSubmit}>
            <div className="form-group">
                <label htmlFor="yellowCard">Yellow Card:</label>
                <input
                    type="number"
                    id="yellowCard"
                    value={yellowCard}
                    onChange={(e) => setYellowCard(e.target.value)}
                />
            </div>
            <div className="form-group">
                <label htmlFor="redCard">Red Card:</label>
                <input
                    type="number"
                    id="redCard"
                    value={redCard}
                    onChange={(e) => setRedCard(e.target.value)}
                />
            </div>
            <div className="form-group">
                <label htmlFor="goals">Goals:</label>
                <input
                    type="number"
                    id="goals"
                    value={goals}
                    onChange={(e) => setGoals(e.target.value)}
                />
            </div>
            <div className="form-group">
                <label htmlFor="assist">Assist:</label>
                <input
                    type="number"
                    id="assist"
                    value={assist}
                    onChange={(e) => setAssist(e.target.value)}
                />
            </div>

            <div className="form-group">
                <div className="search-container">
                    <div className="search-input" style={{ borderColor: userName ? 'initial' : 'red' }}>
                        <input
                            type="text"
                            id="userName"
                            autoComplete="false"
                            value={userName}
                            onChange={(e) => { setuserName(e.target.value); }}
                            required
                            placeholder="Search for a user..."
                        />
                        <SavedSearchIcon />
                    </div>
                    {showDropdown && (
                        <div className="search-dropdown">
                            {searchResult.map((result) => (
                                <div key={result.id} className="search-item" onClick={() => { handlePlayer(result); }}>
                                    {result.userName}
                                </div>
                            ))}
                        </div>
                    )}
                </div>
            </div>

            <button type="submit" onClick={() => onSubmit()}>Submit</button>
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


export default InsertActivites;