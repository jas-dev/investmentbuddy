import React from 'react';
import ReactDOM from 'react-dom';
import {BrowserRouter as Router} from 'react-router-dom';
import {createStore} from "redux";
import {Provider} from 'react-redux'

import App from './components/app';
import rootReducer from './reducers';
import { checkAuth } from './actions/actions';

const store = createStore(rootReducer);

if(localStorage.getItem('investmentBuddy')){
    store.dispatch({
        type: 'LOG_USER_IN'
    });

    checkAuth(store.dispatch);
}

ReactDOM.render(
    <Provider store={store}>
        <Router>
            <App />
        </Router>
    </Provider>,
    document.getElementById('root')
);
