import React, {Component} from 'react';

class AddFunds extends Component {
    render(props) {

        console.log('sign in form props:', props);
        return (
            <form>
                <div className='input-field'>
                    <input id='add-funds' name='add-funds' type='text'/>
                    <label htmlFor='add-funds'>Add Funds</label>
                </div>

                <button className='confirm btn btn-small black center '>Submit</button>
                <button className='cancel btn btn-small black center '>Cancel</button>

            </form>
        );
    };
}

export default AddFunds;
