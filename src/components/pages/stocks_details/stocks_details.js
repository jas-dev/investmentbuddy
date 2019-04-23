import React, {Component} from 'react';
import Card from '../../stocks_details_card/detailscard'

class StocksDetails extends Component{
    render(){
        return(
            <div className='details-wrapper '>
                <h5 className=''>Stock Details</h5>

                <div className='row card'>
                    <div className='col s12 '>
                        <Card/>
                    </div>
                    <div className='col s12'>
                        <p><span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dignissimos dolorum illo ipsum labore molestiae natus repellendus sed tenetur! Accusamus consequuntur deleniti deserunt, esse harum illum magnam natus nesciunt sapiente veritatis?</span>
                        </p>
                    </div>
                </div>
            </div>

        )
    }
}

export default StocksDetails;