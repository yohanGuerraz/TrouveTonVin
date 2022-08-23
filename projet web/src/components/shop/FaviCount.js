import React, {useContext} from 'react'
import {FaviContext, uMoney}  from 'contexts/favi'

const FaviCount = () => {
	console.log(`CartCount()`)
	
	const {data} = useContext(FaviContext)
    console.log(data)
	const numItems = data.reduce((ttl, {count}) => ttl + count, 0) // Total the "count"
	
	return (
		<div>
			<i class="fa far fa-heart fa-2x"></i> <span>{Boolean(numItems) && numItems}</span>
		</div>
	)
}

export default FaviCount