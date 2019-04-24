import React, {Component, Fragment} from 'react';
import Table from '../render_table/render_table'

class Watchlist extends Component{
    render(){
        return(
           <div className='container'>
                <h5 className=''>Watchlist</h5>
                <Table/>
           </div>
        )
    }
}

export default Watchlist;