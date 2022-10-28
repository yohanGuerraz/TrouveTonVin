import React, {useContext} from 'react'
import Layout from '../shop/Layout'
import {CartContext, utilMoney} from '../shop/contexts/cart'
import ProductsContext from '../shop/contexts/products'
import Image from '../shop/Image'
import Removebtn from '../shop/Removebtn'
import styled from 'styled-components'
import {Link} from 'react-router-dom'


const Checkout = ({data,page_tit}) => {
	
	const cart = useContext(CartContext).data
	// const products = useContext(ProductsContext).data
	const products = useContext(ProductsContext)
	let subtotal = 0


	return (
		<Layout page_title = {page_tit}>
			<ul>
				{
					(cart.length)
						? (cart.map(item => {
 
							let {id, prod_img, prod_name, prod_prices, cost} = products.find(prod => prod.id === item.id)
							console.log(prod_prices[1]+" check out")
							subtotal += prod_prices[1] * item.count
							return <Model2>
								<Link to={`/single_product/${id}`}>
									<Image src={prod_img[0]} alt={prod_name} className="thumbcart" ></Image> 
									<h2 className="cartProduct" key={item.id}>
										<b>{prod_name}</b> 
										({item.count} x {utilMoney(prod_prices[1])}) 
										<b>= {utilMoney(prod_prices[1] * item.count)}</b>
									</h2>
								</Link>
								<Removebtn data={item}> </Removebtn>
							</Model2> }))
						: (<div>Aucun article dans votre panier, essayez d'aller à la <Link to="/shop">boutique</Link></div> )
				}
			</ul>
			<footer>
				{Boolean(cart.length) && <div><button className="add-to-cart-btn">Valider {utilMoney(subtotal)}</button></div>}
			</footer>
		</Layout>
	)
}

const Model2 = styled.div`
padding-top: 0px;
border-bottom:1px solid white;
display:flex;
margin-bottom: 2em; 
justify-content:space-around;
`

export default Checkout