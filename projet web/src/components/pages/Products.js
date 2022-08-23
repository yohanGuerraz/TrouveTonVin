import React, {useState} from 'react'
import Layout from '../shop/Layout'
// import SearchFilter from 'components/SearchFilter'
import SearchResults from '../shop/SearchResults'
import Title from 'antd/lib/skeleton/Title'

const Products = ({data,page_tit}) => {


  const [searchState, setSearchState] = useState({
    catergories: [],
    weight: [],
    rating: 0,
    sort: (a, b) => a.prod_prices[1] - b.prod_prices[1]
  })

  // For convenience, destructure all of the values into local variables
  const {catergories, weight, rating, sort} = searchState

  // ****** FILTER ******
  // Filter the results into a new array that's the same size or smaller
  const filteredArray = data.filter(({prod_rating}) => rating == prod_rating || rating === 0 ) 
                                  .filter(({prod_cat}) => catergories.length === 0 || 
                                                        prod_cat.filter((cat) => catergories.includes(cat)).length > 0)
                                  .filter(({prod_weight}) => weight.length === 0 || 
                                                        prod_weight.filter((wght) => weight.includes(wght)).length > 0) 
                                  .sort(sort)  

// Product category filter
const onCategoryChange = ({target}) => {
  if (target.checked) {
    setSearchState({
      ...searchState,
      catergories: [...searchState.catergories, target.value]
    })
  } else {
    setSearchState({
      ...searchState,
      catergories: searchState.catergories.filter((catergory) => catergory !== target.value)
    })
  }
}  

// Product weight filter
const onWeightChange = ({target}) => {
    const wt = parseInt(target.value)
  if (target.checked) {
    setSearchState({
      ...searchState,
      weight: [...searchState.weight, wt]
    })
    console.log(weight)
  } else {
    console.log(`nothing`)
    setSearchState({
      ...searchState,
      weight: searchState.weight.filter((wght) => wght !== wt)
    })
  }
}  

// Product filter for rating
const onRatingChange = (event) => {
  setSearchState({
    ...searchState,
    rating: event.target.value
  })
}

// Filter for Sorting
const handleSortChange = ({target}) => {
  let sorting
  if (target.value === "0") {
    sorting = (a, b) => a.prod_prices[1] - b.prod_prices[1]
  } else if (target.value === "1") {
    sorting = (a, b) => b.prod_prices[1] - a.prod_prices[1]
  }

  setSearchState({
    ...searchState,
    sort: sorting
  })
}

  //  Toggle the product filters to show when button is click
  const menuFilters = () => {
    const filt_toggle = document.querySelector(`.filt-toggle`)
    const filters = document.querySelector(`.filters`)
    try {
      filt_toggle.addEventListener('click',function () {
        if (filters.classList.contains(`m-hide`)) {
          filters.classList.remove('m-hide')
        } else {
          filters.classList.add('m-hide')
        }
      })
    }
    catch(err) {
      console.log("Error message: "+err.message)
    }
  }

  return (
    <Layout page_title = {page_tit}>

{/* <!-- Side Bar--> */}
      <aside className="sidebar">
        {/* <!-- Filtering product form -->     */}

        <div className="filter-toggle">
          <button onClick={menuFilters} type="button" className="filt-toggle" name="filter button">
            {/* <!-- <span class="material-icons">menu</span> --> */}
            <i className="fa fa-bars fa-2x"></i>
          </button>            
          <h2>Filtres</h2>
        </div>

        <form className="filters m-hide">
          <div className="filter-options">
            <fieldset id="filterCategory" onChange={onCategoryChange}  >
              <legend>Category</legend>
              <ul className="filter-list">
                <li>
                  <input type="checkbox" name="filt_cat" value="dessert" id="dessert-wine" className="checkbox.hide" /> 
                  <label htmlFor="dessert-wine"><div className="control-me"></div>Vin de Dessert</label>  
                </li>
                <li>
                  <input type="checkbox" name="filt_cat" value="rose" id="rose-wine" className="checkbox.hide" /> 
                  <label htmlFor="rose-wine"><div className="control-me"></div>Rosé</label>
                </li>
                <li>
                  <input type="checkbox" name="filt_cat" value="rouge" id="red-wine" className="checkbox.hide" /> 
                  <label htmlFor="red-wine"><div className="control-me"></div>Vin Rouge</label>
                  
                </li>
                <li>
                  <input type="checkbox" name="filt_cat" value="blanc" id="white-wine" className="checkbox.hide" /> 
                  <label htmlFor="white-wine"><div className="control-me"></div>Vin Blanc</label>
                  
                </li>
              </ul>
            </fieldset>
            <fieldset id="filterWeight" onChange={onWeightChange} >
              <legend>Volume</legend>
              <ol className="filter-list">
                <li>
                  <input type="checkbox" name="filt_weight" value="100" id="100g" className="checkbox.hide" />
                  <label htmlFor="100g"><div className="control-me"></div>100g</label>
                  
                </li>
                <li>
                  <input type="checkbox" name="filt_weight" value="200" id="200g" className="checkbox.hide" />
                  <label htmlFor="200g"><div className="control-me"></div>200g</label>
                  
                </li>
                <li>
                  <input type="checkbox" name="filt_weight" value="500" id="500g" className="checkbox.hide" /> 
                  <label htmlFor="500g"><div className="control-me"></div>500g</label>
                  
                </li>
                <li>
                  <input type="checkbox" name="filt_weight" value="800" id="800g" className="checkbox.hide" />
                  <label htmlFor="800g"><div className="control-me"></div>800g</label>
                  
                </li>
              </ol>
            </fieldset>
            <fieldset id="rating" onChange={onRatingChange}>
              <legend>Notes</legend>
              <ol className="filter-list">
                <li>
                  <input type="radio" name="rating" value="4" id="aboveFour" className="checkbox.hide" />
                  <label htmlFor="aboveFour" className="rating">
                    <span className="material-icons">star</span><span className="material-icons" >star</span><span className="material-icons">star</span><span className="material-icons">star</span><span className="material-icons">star_border</span>
                    <div className="control-me"></div>
                  </label>
                  
                </li>
                <li>
                  <input type="radio" name="rating" value="3" id="aboveThree" className="checkbox.hide" />
                  <label htmlFor="aboveThree" className="rating">
                    <span className="material-icons">star</span><span className="material-icons">star</span><span className="material-icons">star</span><span className="material-icons">star_border</span><span className="material-icons">star_border</span>
                    <div className="control-me"></div>
                  </label>
                  
                </li>
                <li>
                  <input type="radio" name="rating" value="2" id="aboveTwo" className="checkbox.hide" />
                  <label htmlFor="aboveTwo" className="rating">
                    <span className="material-icons">star</span><span className="material-icons">star</span><span className="material-icons">star_border</span><span className="material-icons">star_border</span><span className="material-icons">star_border</span>
                    <div className="control-me"></div>
                  </label>
                  
                </li>
                <li>
                  <input type="radio" name="rating" value="1" id="aboveOne" className="radio.hide" />
                  <label htmlFor="aboveOne" className="rating">
                    <span className="material-icons">star</span><span className="material-icons">star_border</span><span className="material-icons">star_border</span><span className="material-icons">star_border</span><span className="material-icons">star_border</span>
                    <div className="control-me"></div>
                  </label>
                  
                </li>
              </ol>
            </fieldset>
          </div>
          <fieldset>
            <label htmlFor="sort">Triés par</label>
            {/* <select name="sort" id="sortBy" className="sort" defaultValue="0" onChange={handleSortChange}> */}
            <select name="sort" id="sortBy" className="sort"  onChange={handleSortChange}>
              <option value="1">Prix, du plus grand au plus petit</option>
              <option value="0">Prix, du plus petit au plus grand</option>
            </select>
          </fieldset>
        </form>
      </aside>

      <SearchResults result={filteredArray} />

    </Layout>
  )
}

export default Products