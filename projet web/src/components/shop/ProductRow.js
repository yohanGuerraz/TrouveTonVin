import React, {useContext} from 'react'
import {Link} from 'react-router-dom'
import Image from './Image'
import Item from './Item'
import FavItem from './FavItem'
import {CartContext, utilMoney} from './contexts/cart'


const ProductRow = ({data}) => {
  const {id, prod_img, prod_link, prod_name, prod_desc, prod_prices, prod_rating, prod_cat, prod_weight} = data

   // State will hold the image url

//  const [img, setImg] = useState(``)

//  import(`img/${photo}`).then((image) => setImg(image.default))

    const article_item = document.createElement('article')
    // Adding class name product to the article created
    article_item.classList.add('product')

    article_item.innerHTML = `<p>Hello</p>`

    let the_r = []
    for (let x = 0; x < 5; x++) {
        if (prod_rating > x) {
            the_r.push(<span className="material-icons">star</span>)
        } else {
            the_r.push(<span className="material-icons">star_border</span>)
        }
    }

    const the_w = prod_weight.map((wght) => <li><label><input type="radio" name="size" value="m" key={id}/>{wght}g</label></li>)
    const the_c = prod_cat.map((cat) => <li><label><input type="radio" name="category" value="r"/>{cat}</label></li>)



    
    return (
        <article className="product">
            <Image src={prod_img[0]} alt={prod_name} className="p_image"/>
            {/* <img src={p_Img} alt={prod_name} className="p_image" /> */}
            <div className="prod-details">
                <h3><Link to={`/single_product/${data.id}`}> {prod_name} </Link></h3>
                <p>{prod_desc} <Link to={`/single_product/${data.id}`}>voir plus</Link></p>
                <dl className="rating">
                    <data value={prod_prices[1]}><del>{prod_prices[0]}€</del> <ins>{prod_prices[1]}€</ins></data>
                    <dd><p>note : {prod_rating}</p>
                    {the_r}</dd>
                </dl>
            
                <form className="iterm-properties">
                    <fieldset>
                    <legend>Categorie</legend>
                    <ul>
                        {the_c}
                    </ul>
                    </fieldset>
                    <fieldset>
                    <legend>Volume en grammes</legend>
                    <ol className="weight">
                        {the_w}
                    </ol>
                    </fieldset>
                </form>
                <div className="prodcut-list-cart">
                    {/* <button type="button" className="add-to-cart-btn"><i className="fa fas fa-shopping-cart"></i> Add to Cart</button> */}
                    <Item key={id} data={data} />
                    <FavItem key={id} data={data} />
                    {/* <button type="button" className="add-to-fav"><i className="fa far fa-heart" name="Whist List"></i></button> */}
                </div>
            </div>
        </article>
    )
}


export default ProductRow