import {createContext} from 'react'
 

const CartContext = createContext()
const useMoney = (cents) => {
	return `$${(cents).toFixed(2)}`
}

export {CartContext, useMoney}