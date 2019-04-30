export function signIn(userData) {
    return {
        type: 'LOG_USER_IN',
        ...userData
    };
}