import axios from "axios";

export function signIn() {
    return {
        type: 'LOG_USER_IN'
    };
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
