import React, {Component} from 'react';
import Card from '../../stocks_details_card/detailscard'

class StocksDetails extends Component{
    render(){
        return(
            <div className='details-wrapper'>
                <h5 className='green-text text-darken-3'>
                    Explore past and current stock data, run what-if scenarios and future projections</h5>

                <div className='row card'>
                    <div className='col s6 card'>
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