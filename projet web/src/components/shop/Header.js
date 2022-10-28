import React, { useEffect, useState } from 'react'
import logo from '../../assets/images/winHubLogo1.png';
import {Link} from 'react-router-dom'
import CartCount from './CartCount'
import FaviCount from './FaviCount'

const Header = ({page_title}) => {

// To determine which page style to impliment based on the page title
  const pane = page_title ? page_title+" PAGE" : "PAGE TITLE"

  // Event Listerner Toggle the Nav menu to show when button is click
  const menuToggle = () => {
      const nav_toggle = document.querySelector(`.nav-toggle`)
      const navigation = document.querySelector(`.navigation`)
      nav_toggle.addEventListener('click',function () {
        if (navigation.classList.contains(`m-hide`)) {
          navigation.classList.remove('m-hide')
          navigation.classList.add('nav_style')
        } else {
          navigation.classList.remove('nav_style')
          navigation.classList.add('m-hide')
        }
      })
  }



  return (
    <header className="page-header">
        {/* <!-- Navigation menu and toggle button (non-functional) --> */}
        <button  onClick={menuToggle } type="button" className="nav-toggle" name="menu button">
          {/* <!-- <span className="material-icons">menu</span> --> */}
          <i className="fa fa-bars fa-2x"></i>
        </button>   
        <div className="search-bar m-hide">       
          {/* <!-- Search for a product (non-functional) --> */}
          <form className="search">
            <label>
              <input type="search" name="find" id="find" placeholder="Search for Products..." className="find"/>
            </label>
            <button type="button"><i className="fa fa-search fa-2x"></i></button>
          </form>  
        </div>

        <div className="top-cart">
          {/* <!-- Additional links --> */}
          <ul className="header-cart">
            {<li> <a href="#"> <i className="fa fa-user-circle fa-2x"></i></a></li>}
            {/* <li><a href="#"><i className="fa far fa-heart fa-2x"></i></a></li> */}
            <Link to="/favorite"><FaviCount /></Link>
            {/* <li><a href="#"><i className="fa fas fa-shopping-cart fa-2x" aria-label="Items in your cart"></i></a></li> */}
            <Link to="/cart"><CartCount /></Link>
          </ul>
        </div>

        {/* <!-- LOGO --> */}
        <div className="logo">
          <Link to="/shop" rel="home" className="site-logo">
            <img src={logo} alt="WINE HUB."/>
            {/* <!-- Site logo --> */}
          </Link>
        </div>

        {/* <!-- Navigation menu -->       */}
        <nav aria-label="Primary" className="navigation  m-hide">
          <ul className="menu">
            <li><Link to="/">HOME</Link></li>
            <li><Link to="/shop">Shop</Link>
              <ul className="submenu">
                <li><Link to="/shop">Vin de Dessert</Link></li>
                <li><Link to="/shop">Vin Rouge</Link></li>
                <li><Link href="/shop">Rosé</Link></li>
                <li><Link to="/shop">Vin Blanc</Link></li>
              </ul>
            </li>
            <li><Link to="/login">About</Link></li>
            <li><Link to="/Profile">Contact</Link></li>
          </ul>
        </nav>

      {/* <!-- Page Title --> */}
      <div className="page-title">
        <h2>{pane}</h2>
      </div>
    </header>
  )
}

export default Header