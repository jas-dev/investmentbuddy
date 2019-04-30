import React from 'react';
import {Route, Switch} from 'react-router-dom';
import NotFound from '../pages/404';
import SignIn from '../pages/sign_in_page';

export default props=>{
    const {match} = props;
    console.log('match:',match);
    console.log('account route props:',props);

    return (
        <Switch>
            <Route path={`${match.path}`} component={SignIn}/>
            <Route component={NotFound}/>
        </Switch>
    );
}