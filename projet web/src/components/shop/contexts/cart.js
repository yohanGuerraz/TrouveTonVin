import {createContext} from 'react'
 

const CartContext = createContext()
const utilMoney = (cents) => {
	return `$${(cents).toFixed(2)}`
}

export {CartContext, utilMoney}