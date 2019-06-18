
if(sessionStorage.investmentBuddy){
    var DEFAULT_STATE = {
        auth: true,
        username: '',
        id: null,
        token: ''
    };
} else if(!sessionStorage.investmentBuddy){
    DEFAULT_STATE = {
        auth: false,
        username: '',
        id: null,
        token: ''
    };
}


function userReducer(state = DEFAULT_STATE, action){
    switch(action.type){
        case 'USER_SIGN_UP':
        case 'LOG_USER_IN':
            return {
                ...state, auth: true
            };
        case 'LOG_DEMO_USER_IN':
            return {
                ...state, auth: true
            };
        case 'LOG_USER_OUT':
            return {
                ...DEFAULT_STATE, auth: false
            };
        default:
            return state;
    }
}

export default userReducer;

