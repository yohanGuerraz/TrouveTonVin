import React, {useState} from 'react'
import ProductRow from 'ProductRow'
import { Pagination } from 'antd';
// import 'antd/dist/antd.css';


// Modify the new element, create the templete for all product.
const SearchResults = ({result}) => {

  // function itemRender(current, type, originalElement) {
  //   if (type === 'prev') {
  //     return <a>Previous</a>;
  //   }
  //   if (type === 'next') {
  //     return <a>Next</a>;
  //   }
  //   return originalElement;
  // }

  const [currPage, setCurrPage] = useState(1)
  const pageSize = 3
  const startRow = (currPage - 1) * pageSize
  const endRow = startRow + pageSize
  const totalPages = Math.ceil(result.length / pageSize)


    const theProducts = result.slice(startRow,endRow).map((product) => <ProductRow key={product.id} data={product} />)
    // console.log(theProducts)

  return (
    <section className="results">
        <h2 className="subheading">Resultats</h2>

        <div id="prod">
            { (theProducts.length === 0)? <div className="noMatch"><h2>No Product Match</h2></div> : theProducts}
        </div>

        {/* <!-- Navigation Section --> */}
        <nav aria-label="Pagination" className="pagination">
        <p><span>Showing  </span>  
           {theProducts.length} {(theProducts.length === 1) ? `product` : `products`} of {result.length}
        </p>
        <p className="pages"><Pagination defaultCurrent={currPage} total={result.length} defaultPageSize={pageSize} onChange={(page) => setCurrPage(page)}
          
        /></p>
        </nav>
    </section>
  )
}

export default SearchResults