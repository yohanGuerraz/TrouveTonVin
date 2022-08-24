import React, {useContext} from 'react'
import {CartContext, utilMoney} from './contexts/cart'
import styled from 'styled-components'

const Removebtn = ({data}) => {
	// console.log(prod_name)
    const {id, prod_img, prod_link, prod_name, prod_desc, prod_prices, prod_rating, prod_cat, prod_weight} = data
    console.log(prod_desc)
	const {cart_data, updater} = useContext(CartContext)
    const deleteProduct = () => {
        // const newItems = cart_data.filter((item) => item.id !== data.id)
        // updater(() =>{
        //     return newItems
        // })
    }
	
	return <CancelBtn> <i onClick={deleteProduct()} class="fa fas fa-window-close" aria-hidden="true"></i>  </CancelBtn>  
}

const CancelBtn = styled.div`

`


export default Removebtn