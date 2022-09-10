import React, {useState, useContext} from 'react'
import ProductsContext from '../shop/contexts/products'
import Layout from '../shop/Layout'
import Image from '../shop/Image'
import facebook from '../../assets/images/facebook(1).png'
import google_plus from '../../assets/images/google-plus.png'
import instagram from '../../assets/images/instagram(2).png'
import pinterest from '../../assets/images/pinterest.png'
import twitter from '../../assets/images/twitter.png'
import Item from '../shop/Item'
import FavItem from '../shop/FavItem'
import {useParams} from 'react-router-dom'
import '../../css/single-product.css'

const Single_product = ({data, page_tit}) => {

  const products = useContext(ProductsContext)
  const {slug} = useParams()
  const {id, prod_img, prod_link, prod_name, prod_desc, prod_prices, prod_rating, prod_cat, prod_weight} = products.find(product => product.id == slug)
  const [bigImage, setImage] = useState(prod_img[0]) 
  const prd = products.find(product => product.id == slug)

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
    <Layout page_title = {page_tit}>
          {/* MAIN PRODUCT SECTION  */}
        <article className="single-product">
          <section className="prod-images">
            {/* <img src="img/5b.jpg" alt="Product Image1" className="thumb"/>
            <img src="img/5c.jpg" alt="Product Image2" className="thumb"/>
            <img src="img/3c.jpg" alt="Product Image3" className="thumb"/> */}
            <Image onClick={() => {setImage(prod_img[0])}} src={prod_img[0]} alt={prod_name} className="thumb" />
            <Image onClick={() => {setImage(prod_img[1])}} src={prod_img[1]} alt={prod_name} className="thumb" />
            <Image onClick={() => {setImage(prod_img[2])}} src={prod_img[2]} alt={prod_name} className="thumb"/>
            <div className="prod-main-pic">
              {/* <img src="img/5b.jpg" alt="Product Image" id="main_pic"/> */}
              <Image src={bigImage} alt={prod_name} id="main_pic"/>
            </div>
          </section>

          <section className="prod-summary">
              <div className="prod-details">
                  <h3>{prod_name}</h3>
                  <p>Here is a shot of this product that might entice a user to click and add it to their cart. <a href="#">voir plus</a></p>
                  <dl className="rating">
                  <data value={prod_prices[1]}><del>{prod_prices[0]}€</del> <ins>{prod_prices[1]}€</ins></data>
                    <dd><p>note : {prod_rating}</p>
                    {the_r}</dd>
                  </dl>
      
                  <div className="shipping-info">
                    <h4>Shipping Type: Standard Ground</h4>
                    <h4>Estimated Delivery Time: Product will delivery in 4-6 business hours</h4>
                    <p>{prod_desc}.</p>
                    <p>Lorem, ipsum dolor sit amet consectetur adipisicing elit. Sit asperiores excepturi assumenda quas doloribus laborum unde officiis. Consequuntur saepe laudantium, eum inventore similique autem expedita numquam odit. Aliquam, pariatur tempora.</p>
                  </div>

                  <form className="iterm-properties">
                    <fieldset>
                      <legend>Categorie</legend>
                        <ul>
                          {the_c}
                        </ul>
                    </fieldset>
                    <fieldset>
                      <legend>Volume</legend>
                        <ol className="weight">
                          {the_w}
                        </ol>
                    </fieldset>
                  </form>
                  <div className="prodcut-list-cart">
                    <Item key={id} data={prd } />
                    <FavItem  key={id} data={prd } />
                  </div>
                </div>
          </section>
        </article>
        
        {/* RELATED PRODUCT SECTION */}
        <section className="prod-description">
          <h3>description</h3>
          <div className="detauls">
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repudiandae ducimus quas facilis est doloremque, in laudantium fuga iusto! Quasi repudiandae inventore adipisci illum est, enim esse facere minus sequi eos!</p>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Repudiandae ducimus quas facilis est doloremque, in laudantium fuga iusto! Quasi repudiandae inventore adipisci illum est, enim esse facere minus sequi eos!</p>
          </div>
        </section>
    
        <section className="related-prod">
          <h3>RELATED PRODUCTS</h3>
          <div className="other-prods">
              <div className="related-prod01">
                {/* <img src="img/5a.jpg" alt="Related Product 1" /> */}
                <p>Category</p>
                <h4 className="related-pro-name"><a href="product-page.html">Product  Name</a></h4>
                <dl className="rating">
                  <data value="39"><del>$50.00</del> <ins>$39.00</ins></data>
                  <dd><p>Rating : 4.4</p> <span className="material-icons">star</span><span className="material-icons">star</span><span className="material-icons">star</span><span className="material-icons">star</span><span className="material-icons">star_half</span></dd>
                </dl>
              </div>
              <div className="related-prod01">
                {/* <img src="img/5a.jpg" alt="Related Product 2" /> */}
                <p>Category</p>
                <h4 className="related-pro-name"><a href="product-page.html">Product  Name</a></h4>
                <dl className="rating">
                  <data value="39"><del>$50.00</del> <ins>$39.00</ins></data>
                  <dd><p>Rating : 4.4</p> <span className="material-icons">star</span><span className="material-icons">star</span><span className="material-icons">star</span><span className="material-icons">star</span><span className="material-icons">star_half</span></dd>
                </dl>
              </div>
              <div className="related-prod01">
                {/* <img src="img/5a.jpg" alt="Related Product 3" /> */}
                <p>Category</p>
                <h4 className="related-pro-name"><a href="product-page.html">Product  Name</a></h4>
                <dl className="rating">
                  <data value="39"><del>$50.00</del> <ins>$39.00</ins></data>
                  <dd><p>Rating : 4.4</p> <span className="material-icons">star</span><span className="material-icons">star</span><span className="material-icons">star</span><span className="material-icons">star</span><span className="material-icons">star_half</span></dd>
                </dl>
              </div>
            </div>
          </section>
    </Layout>
  )



}

export default Single_product 