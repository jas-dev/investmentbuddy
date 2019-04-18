import React from 'react';
import 'materialize-css/dist/css/materialize.min.css';
import 'materialize-css/dist/js/materialize.min';
import '../assets/css/app.scss';


import Landing from './pages/landing';

const App = () => (
    <div>
        <div className="app">
            <Landing/>
        </div>
    </div>
);

export default App;
