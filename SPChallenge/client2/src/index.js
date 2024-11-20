import React from "react";
import ReactDOM from "react-dom/client";
import App from "./App";

// Bootstrap CSS
//import "Install-Package bootstrap";
// Bootstrap Bundle JS
//import "bootstrap/dist/js/bootstrap.bundle.min";

import { BrowserRouter as Router } from "react-router-dom";

const root = ReactDOM.createRoot(document.getElementById("root"));
root.render(
  <Router>
    <App />
  </Router>
);