import React, { useEffect, useState } from 'react';
import './GridViewDesign.css'
import Cookies from 'universal-cookie';

const cookies = new Cookies();
const ITEMS_PER_PAGE = 10;


const GridViewStade = ({ data }) => {
  const [currentPage, setCurrentPage] = useState(1);
  const [selectedItem, setSelectedItem] = useState(null);

  const indexOfLastItem = currentPage * ITEMS_PER_PAGE;
  const indexOfFirstItem = indexOfLastItem - ITEMS_PER_PAGE;
  const currentItems = data.slice(indexOfFirstItem, indexOfLastItem);

  const totalPages = Math.ceil(data.length / ITEMS_PER_PAGE);

  const handlePageChange = (pageNumber) => {
    setCurrentPage(pageNumber);
  };

  const handleItemClick = async (item) => {
    await setSelectedItem(item);
  };

  useEffect(() => {
    if (selectedItem) {
      cookies.set('stadeSelected', selectedItem);
    }
  }, [selectedItem]);

  return (
    <div className="container mt-5">
      <div className="table-responsive">
        <table className="table table-sm">
          <thead className='thead-dark'>
            <tr>
              <th>Name</th>
              <th>Mobile No</th>
              <th>Email</th>
              <th>Address</th>
              <th>Status</th>
              <th>Status Description</th>
              <th>Image</th>
              <th>Capacity</th>
              <th>Stade Type</th>
              <th>Created Date</th>
              <th>Created By</th>
            </tr>
          </thead>
          <tbody className='table-light'>
            {currentItems.map(item => (
              <tr key={item.id} onClick={() => handleItemClick(item)} className={selectedItem === item ? 'table-success' : ''}>
                <td>{item.name}</td>
                <td>{item.mobileNo}</td>
                <td>{item.email}</td>
                <td>{item.address}</td>
                <td>{item.status == 1 ? "Open" : "Close"}</td>
                <td>{item.statusDes}</td>
                <td><img src={item.image} alt="Stade" /></td>
                <td>{item.capacity}</td>
                <td>{item.stadeType === 1 ? "Outdoor" : "Indoor"}</td>
                <td>{new Date(item.creationDate).toLocaleDateString("en-GB")}</td>
                <td>{item.createdBy}</td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
      <div className="d-flex justify-content-center">
        <nav aria-label="Page navigation">
          <ul className="pagination">
            <li className={`page-item ${currentPage === 1 ? 'disabled' : ''}`}>
              <button className="page-link" onClick={() => handlePageChange(currentPage - 1)}>Previous</button>
            </li>
            <li className="page-item"><span className="page-link">{currentPage} / {totalPages}</span></li>
            <li className={`page-item ${currentPage === totalPages ? 'disabled' : ''}`}>
              <button className="page-link" onClick={() => handlePageChange(currentPage + 1)}>Next</button>
            </li>
          </ul>
        </nav>
      </div>
    </div>
  );
};

export default GridViewStade;