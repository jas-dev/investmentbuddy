import axios from "axios";

export function signIn(values) {
    return async function (dispatch){
        try {
            const resp = await axios.post('/api/login.php', values);

            if (resp.data.success) {
                localStorage.setItem("investmentBuddy", resp.data.userData.token);

                dispatch({
                    type: 'LOG_USER_IN'
                });

                return true;
            }

            throw new Error('Error signing in');

        } catch(err){
            return false;
        }
    }
}

export function signInDemo() {
    return async function (dispatch){

        try {
            const resp = await axios.post('/api/setup_demo_account.php');

            if (resp.data.success) {
                sessionStorage.setItem("investmentBuddy", resp.data.userData.token);

                dispatch({
                    type: 'LOG_DEMO_USER_IN'
                });

                return true;
            }

            throw new Error('Error signing in');

        } catch(err){
            return false;
        }
    }
}

export function signOut() {
    if(localStorage){
        localStorage.removeItem("investmentBuddy");
    }
    if(sessionStorage){
        sessionStorage.removeItem("investmentBuddy");
    }
    return {
        type: 'LOG_USER_OUT'
    };
}


export async function checkAuth(dispatch){
    var token = null;

    //original code in checkAuth creates token from local storage. endpoint called only references session data, so I do not understand how session data gets converted to localstorage in that case.
    //assumption made with new code below is that we do not have both local and session data here- it will be local if regular user, session if demo user.
    if(localStorage.investmentBuddy){
        token = localStorage.getItem("investmentBuddy");
    } else if(sessionStorage.investmentBuddy){
        token = sessionStorage.getItem("investmentBuddy"); //again key may be incorrect for session
    }

    const { data: { success = false } } = await axios.post("/api/checkloggedin.php", {
        token: token
    });

    if (success) {
        return dispatch({
            type: 'LOG_USER_IN'
        });
    }

    dispatch({
        type: 'LOG_USER_OUT'
    });
}
