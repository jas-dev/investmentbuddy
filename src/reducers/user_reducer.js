
const DEFAULT_STATE = {
    auth: false,
    email: ''
};


function userReducer(state = DEFAULT_STATE, action){
    switch(action.type){
        default:
            return state;
        case 'LOG_USER_IN':
            return {
                ...state, auth: true, email: action.email
            };
    }
}

export default userReducer;