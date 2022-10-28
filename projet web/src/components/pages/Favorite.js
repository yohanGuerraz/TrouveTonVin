import React, {useContext} from 'react'
import Layout from '../shop/Layout'
import {FaviContext, uMoney} from '../shop/contexts/favi'
import ProductsContext from '../shop/contexts/products'
import Removebtn from '../shop/Removebtn'
import Item from '../shop/Item'
import Image from '../shop/Image'
import styled from 'styled-components'
import {Link} from 'react-router-dom'


const Favorite = ({data,page_tit}) => {
	
	const favi = useContext(FaviContext).data
	// const products = useContext(ProductsContext).data
	const products = useContext(ProductsContext)
	let subtotal = 0


	return (
		<Layout page_title = {page_tit}>
				<ul>
					{ 
						(favi.length)
							? (favi.map(item => {

								let {id, prod_img, prod_name, prod_prices, cost} = products.find(prod => prod.id === item.id)
								subtotal += prod_prices[1] * item.count
								return <Model2>
											<Link to={`/single_product/${id}`}>
												<Image src={prod_img[0]} alt={prod_name} className="thumbcart" ></Image> 
												<h2 className="cartProduct" key={item.id}>
													<b>{prod_name}</b>
													({item.count} x {uMoney(prod_prices[1])}) 
													<b>= {uMoney(prod_prices[1] * item.count)}</b>
												</h2>
											</Link>
											<Removebtn data={item}> </Removebtn> 
											<Item key={item.id} data={item} className="addfav"/>
										</Model2> }))
							: (<div>Aucun article dans votre panier, essayez d'aller à la <Link to="/shop">boutique</Link></div> )
					}
				</ul>
				<footer>
					{/* {Boolean(favi.length) && <div><button className="add-to-cart-btn">Check out {uMoney(subtotal)}</button></div>} */}
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

export default Favorite