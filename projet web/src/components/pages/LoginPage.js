import React from 'react'
import { Link } from 'react-router-dom'

import '../../css/App.css'

export default function SignInPage() {
    return (
        <div className="text-center m-5-auto">
            <h2>Connection</h2>
            <form action="/shop">
                <p>
                    <label>Nom d'utilisateur ou adresse email</label><br/>
                    <input type="text" name="first_name" required />
                </p>
                <p>
                    <label>Mot de passe</label>
                    <Link to="/forget-password"><label className="right-label">mot de passe oublié?</label></Link>
                    <br/>
                    <input type="password" name="password" required />
                </p>
                <p>
                    <button id="sub_btn" type="submit">Connection</button>
                </p>
            </form>
            <footer>
                <p>vous n'avez pas de compte? <Link to="/register">Créez-le</Link>.</p>
                <p><Link to="/">retour à la page d'accueil</Link>.</p>
            </footer>
        </div>
    )
}
