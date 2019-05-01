export function signIn(userData) {
    return {
        type: 'LOG_USER_IN',
        ...userData
    };
}

export function signOut() {
    return {
        type: 'LOG_USER_OUT'
    };
}