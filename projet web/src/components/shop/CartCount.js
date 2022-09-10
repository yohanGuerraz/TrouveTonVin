import React, {useContext} from 'react'
import {CartContext, useMoney} from '../shop/contexts/cart'

const CartCount = () => {
	console.log(`CartCount()`)
	
	const {data} = useContext(CartContext)
    console.log(data)
	const numItems = data.reduce((ttl, {count}) => ttl + count, 0) // Total the "count"
	
	return (
		<div>
			<i class="fa fas fa-shopping-cart fa-2x"></i> <span>{Boolean(numItems) && numItems}</span>
		</div>
	)
}

export default CartCount