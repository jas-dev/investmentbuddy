
const DEFAULT_STATE = {
    auth: false,
    username: '',
    id: null,
    token: ''
};


function userReducer(state = DEFAULT_STATE, action){
    switch(action.type){
        case 'LOG_USER_IN':
            return {
                ...state, auth: true
            };
        case 'LOG_USER_OUT':
            return {
                ...DEFAULT_STATE
            };
        default:
            return state;
    }
}

export default userReducer;

