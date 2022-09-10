import React, {useContext} from 'react'
import {CartContext, useMoney} from 'contexts/cart'
import $ from "jquery"

const Item = ({data}) => {
	// console.log(prod_name)
    const {id, prod_img, prod_link, prod_name, prod_desc, prod_prices, prod_rating, prod_cat, prod_weight} = data
    console.log(prod_desc)
	const {data1, updater} = useContext(CartContext)

	const btnClick = () => {
		$( "div.success" ).fadeIn( 300 ).delay( 1500 ).fadeOut( 400 );
	}
	
	return (
		<>
			<button onClick={() => {
				 btnClick();
				updater(id, prod_name)
				}} type="button" className="add-to-cart-btn"><i className="fa fas fa-shopping-cart"></i> Ajouter au panier</button>

		
		</>

	)
}

export default Item