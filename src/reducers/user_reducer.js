
const DEFAULT_STATE = {
    auth: false,
    username: '',
    id: null,
    token: ''
};


function userReducer(state = DEFAULT_STATE, action){
    switch(action.type){
        default:
            return state;
        case 'LOG_USER_IN':
            return {
                ...state, auth: true, ...action
            };
    }
}

export default userReducer;