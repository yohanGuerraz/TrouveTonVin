import React from 'react'

const Footer = () => {
  return (
    <footer className="page-footer">
      <div className="main-footer">
        <section className="footer-links">
          <div className="footer-about-us">
            <h3>ABOUT</h3>
            <p>Lorem ipsum, dolor sit amet consectetur adipisicing elit. Laboriosam eius mollitia obcaecati, neque rerum dignissimos, recusandae ducimus qui reiciendis nam necessitatibus? Natus est reprehenderit eligendi facere, cupiditate magnam explicabo in. <a href="">PLUS</a></p>
          </div>
          <div>
            <h3>QIUCK LINKS</h3>
            <ol>
              <li><a href="">HOME</a></li>
              <li><a href="">SHOP</a></li>
              <li><a href="">ABOUT</a></li>
              <li><a href="">CONTACT</a></li>
            </ol>
          </div>
          <div>
            <h3>CATEGORIES</h3>
            <ol>
              <li><a href="">VIN DE DESSERT</a></li>
              <li><a href="">VIN ROUGE</a></li>
              <li><a href="">ROSÉ</a></li>
              <li><a href="">VIN BLANC</a></li>
            </ol>
          </div>
        </section>
      </div>
    </footer>
  )
}

export default Footer