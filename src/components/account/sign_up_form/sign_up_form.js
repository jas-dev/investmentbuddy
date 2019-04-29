import React from 'react';


const SignUpForm = props =>{

    console.log('sign in form props:', props);
    return(
        <div className="container col s6">
            <div className="card card-padout">
                <form>
                    <div className='input-field'>
                        <input className='input' id='email' name='email' type='text'/>
                        <label htmlFor='email'>Email</label>
                    </div>
                    <div className='input-field'>
                        <input id='password' name='password' type='text' className=''/>
                        <label htmlFor='password'>Create a Password</label>
                    </div>

                    <button className='confirm btn btn-small black'>Submit</button>
                    <button className='cancel btn btn-small black'>Cancel</button>

                </form>
            </div>

        </div>

    );
};

export default SignUpForm;