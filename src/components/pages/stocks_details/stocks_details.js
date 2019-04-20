import React, {Component} from 'react';
import Card from '../../stocks_details_card/detailscard'

class StocksDetails extends Component{
    render(){
        return(
            <div className='details-wrapper z-depth-3'>
                <h5 className='green-text text-darken-5'>See in depth current and historical stock data</h5>
                <div className='divider'/>
                <div className='row'>
                    <div className='col s3'>
                        <Card/>
                    </div>
                    <div className='col s3'>
                        <Card/>
                    </div>
                    <div className='col s6'>
                        <p><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dignissimos dolorum illo ipsum labore molestiae natus repellendus sed tenetur! Accusamus consequuntur deleniti deserunt, esse harum illum magnam natus nesciunt sapiente veritatis?</span>
                        </p>
                    </div>
                </div>
            </div>

        )
    }
}

export default StocksDetails;