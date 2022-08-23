import firebase from 'firebase/app'
import 'firebase/firestore'

  // Your web app's Firebase configuration
  var firebaseConfig = {
    apiKey: "AIzaSyAAy7X1wHSzMzNhmGepiW9VvGvYTM5LQ6w",
    authDomain: "react-ecommerce-fb41c.firebaseapp.com",
    projectId: "react-ecommerce-fb41c",
    storageBucket: "react-ecommerce-fb41c.appspot.com",
    messagingSenderId: "69471512974",
    appId: "1:69471512974:web:736539efcf53d1888c5cdf"
  };

// Initialize Firebase
firebase.initializeApp(firebaseConfig)

// Connect to the DB
const db = firebase.firestore()

export default firebase