import React, { useEffect, useState }  from 'react';
import ReactDOM from 'react-dom';
import App from './App'

console.log("Welcome")
ReactDOM.render(<App />, document.getElementById('root'))

useEffect(() => {
  console.log("its scrolling")
  var navbar = document.querySelector(".menu");
  var sticky = navbar.offsetTop;
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  } 
}, [window.onscroll]) 

// window.onscroll = function() {myFunction()};

// var navbar = document.querySelector('.menu');
// // var load = document.querySelector('loading')
// var sticky = navbar.offsetTop;

// function myFunction() {
//   if (window.pageYOffset >= sticky) {
//     navbar.classList.add("sticky")
//   } else {
//     navbar.classList.remove("sticky");
//   }
// }

// //  Toggle the product filters to show when button is click
// const filt_toggle = document.querySelector(`.filt-toggle`)
// const filters = document.querySelector(`.filters`)

// try {
//   filt_toggle.addEventListener('click',function () {
//     if (filters.classList.contains(`m-hide`)) {
//       filters.classList.remove('m-hide')
//     } else {
//       filters.classList.add('m-hide')
//     }
//   })
// }
// catch(err) {
//   console.log("Error message: "+err.message)
// }

// //  Toggle the product filters to show when button is click
// const nav_toggle = document.querySelector(`.nav-toggle`)
// const navigation = document.querySelector(`.navigation`)
// nav_toggle.addEventListener('click',function () {
//   if (navigation.classList.contains(`m-hide`)) {
//     navigation.classList.remove('m-hide')
//     navigation.classList.add('nav_style')
//   } else {
//     navigation.classList.remove('nav_style')
//     navigation.classList.add('m-hide')
//   }
// })

// ========= Product images ==============
// const the_thumbs = document.querySelectorAll(`.thumb`);
// const main_image = document.querySelector(`#main_pic`);

// const make_clickable = function (thumb){

//     thumb.addEventListener(`click`, function(){
//         console.log("Helloooo this guy")
//         main_image.src = thumb.src;
//         main_image.alt = thumb.alt;
//     })
// }

// the_thumbs.forEach(make_clickable)

