export function signIn() {
    return {
        type: 'LOG_USER_IN'
    };
}

export function signOut() {
    localStorage.removeItem("investmentBuddy")
    return {
        type: 'LOG_USER_OUT'
    };
}

