import React from 'react';
import {Route, Switch} from 'react-router-dom';
import NotFound from '../pages/404';
import SignIn from '../pages/sign_in_page';
import SignOut  from '../pages/sign_out_page';
import auth from '../../../src/hoc/auth';

export default props=>{
    const {match} = props;
    console.log('match:',match);
    console.log('account route props:',props);

    return (
        <Switch>
            <Route path={`${match.path}/sign-in`} component={auth(SignIn,
                '/dashboard', false)}/>
            <Route path={`${match.path}/sign-out`} component={SignOut}/>
            <Route component={NotFound}/>
        </Switch>
    );
}

