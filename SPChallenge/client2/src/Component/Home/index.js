import { useState } from 'react';
import './style.css';
import InsertMatch from './InsertMatch';
import InsertStade from './InsertStade';
import InsertActivites from './InsertActivites';
import Stades from './StadesCretirea';
//import Tabs from 'react-bootstrap/Tabs';

const Home = () => {

  const [activeTab, setActiveTab] = useState('tab1');

  const handleTabClick = (tab) => {
    setActiveTab(tab);
  };

  return (
    <div className="home">
      <h1>Welcome to SPChallenge</h1>
      <p>Discover and enjoy sports like never before.</p>

      <div className="tabs-container ">
        <div className='d-flex justify-content-around'>
        <div className={`tab ${activeTab === 'tab1' && 'active'}`} onClick={() => handleTabClick('tab1')}>
            Stades
          </div>          
          <div className={`tab ${activeTab === 'tab2' && 'active'}`} onClick={() => handleTabClick('tab2')}>
            Insert Stade
          </div>
          <div className={`tab ${activeTab === 'tab3' && 'active'}`} onClick={() => handleTabClick('tab3')}>
            Insert Activites
          </div>
          <div className={`tab ${activeTab === 'tab4' && 'active'}`} onClick={() => handleTabClick('tab4')}>
            Insert Match
          </div>
        </div>
        <div className='mt-4'>
        {activeTab === 'tab1' && <div>{<Stades />}</div>}
        {activeTab === 'tab2' && <div>{<InsertStade />}</div>}
        {activeTab === 'tab3' && <div>{<InsertActivites />}</div>}
        {activeTab === 'tab4' && <div>{<InsertMatch />}</div>}
        </div>
      </div>


    </div>
  );
};

export default Home;