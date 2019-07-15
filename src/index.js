import React from 'react';
import ReactDOM from 'react-dom';
import {BrowserRouter as Router} from 'react-router-dom';
import {applyMiddleware, createStore} from "redux";
import {Provider} from 'react-redux'

import App from './components/app';
import rootReducer from './reducers';
import { checkAuth } from './actions/actions';
import think from './middleware/think';

const store = createStore(rootReducer, applyMiddleware(think));

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
