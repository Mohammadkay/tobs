import "./style.css";
import { useEffect, useRef, useState } from "react";
import { useNavigate } from "react-router-dom";
import fetchAPIs from "../../Hooks/fetchApi";
import Cookies from 'universal-cookie';
import { Button, Card, Heading, Input, Label, Popup, PopupContainer, Container } from './design';

const Login = () => {

  //Properties
  const userRef = useRef();
  const cookies = new Cookies();

  const [userName, setUsername] = useState();
  const [password, setPassword] = useState();
  const [message, setMessage] = useState();
  const [token, setToken] = useState();
  const history = useNavigate();
  const [isAuthenticated, setIsAuthenticated] = useState(true);
  const [isPopupOpen, setIsPopupOpen] = useState(false);


  const accessUser = async () => {
    const api = await fetchAPIs();

    await api.post("https://localhost:7012/api/Login",
      { userName, password }
    )
      .then((res) => {
        console.log(res);
        if (res.data.status == 1 && res.data.data.user.userType == 1) {
          cookies.set('Token_API', res.data.data.token);
          history("/home");
        }
        else if (res.data.data != null && res.data.data.user.userType != 1) {
          // @ts-ignore
          setMessage("The user not authorized for remote login");
          setIsPopupOpen(true);
          setIsAuthenticated(false);
        }
        else {
          setMessage(res.data.errors == "User not found" ? "User not found Please check your username and password." : res.data.errors);
          setIsPopupOpen(true);
          setIsAuthenticated(false);
        }
      }).catch((err) => {
        if (err.response && err.response.data) {
          setMessage(err);
          setIsPopupOpen(true);
          setIsAuthenticated(false);
        }
        console.log(err);
        // @ts-ignore        
        setMessage("Error happened while login, please try again" + err);

        setIsPopupOpen(true);
        setIsAuthenticated(false);
      });

    setUsername(null);
    setPassword(null);
  }

  const handleSubmit = async (e) => {
    e.preventDefault();
    if (!userName || !password) {
      // @ts-ignore
      setMessage('The field is required');
    }
  }


  const closePopup = () => {
    setIsAuthenticated(true);
    setIsPopupOpen(false);
  };

  useEffect(() => {
    // @ts-ignore
    setMessage("");
  }, [userName, password]);

  return (
    <Container>
      {isAuthenticated ? (
        <Card>
          <Heading>Login</Heading>
          <form onSubmit={(e) => handleSubmit(e)}>
            <Label htmlFor="username">Username:</Label>
            <Input
              required
              type="text"
              id="username"
              value={userName}
              // @ts-ignore
              onChange={(e) => setUsername(e.target.value)}
            />

            <Label htmlFor="password">Password:</Label>
            <Input
              required
              type="password"
              id="password"
              value={password}
              // @ts-ignore
              onChange={(e) => setPassword(e.target.value)}
            />
            <Button type="submit" onClick={() => accessUser()}>Login</Button>
          </form>
        </Card>
      ) : (
        <Popup isOpen={isPopupOpen} onRequestClose={closePopup}>
          <PopupContainer>
            <p>{message}</p>
            <Button disabled={false} onClick={closePopup}>Close</Button>
          </PopupContainer>
        </Popup>
      )}
    </ Container>
  );
};

export default Login;