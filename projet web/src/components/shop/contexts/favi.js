import {createContext} from 'react'
 

const FaviContext = createContext()
const uMoney = (cents) => {
	return `$${(cents).toFixed(2)}`
} 

export {FaviContext, uMoney}