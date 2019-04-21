import React, {Component, Fragment} from 'react';
import Table from '../table/table'

class Watchlist extends Component{
    render(){
        return(
           <div className='card'>
                <h5 className='green-text text-darken-3'>Watchlist</h5>
                <Table/>
           </div>
        )
    }
}

export default Watchlist;