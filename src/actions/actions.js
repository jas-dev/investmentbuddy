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
            return false
        }
    }
}

export function signOut() {
    localStorage.removeItem("investmentBuddy");
    console.log('User Signed Out');
    return {
        type: 'LOG_USER_OUT'
    };
}


export async function checkAuth(dispatch){
    const token = localStorage.getItem("investmentBuddy");

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
