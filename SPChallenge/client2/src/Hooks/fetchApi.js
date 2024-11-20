import axios from "axios";
import Cookies from 'universal-cookie';
const cookies = new Cookies();

const getToken = async (token) => {
  token = await cookies.get("Token_API");
  return token
};

const fetchAPIs = async () => {
  const token = await getToken();
  return axios.create({
    headers: {
      'Content-Type': 'application/json',
      'Authorization': `Bearer ${token}`,
    },
  });
}

export default fetchAPIs;


