import React from 'react'
import { Link } from 'react-router-dom'
import temp from '../../App'
import '../../css/App.css'

export default function SignUpPage() {
    
    const handleChangeName = (e) => {
        let value = e.target.value;
        console.log(value);
        value = value.toString()
        
    }
    const handleChangeEmail = (e) => {
        let value = e.target.value;
        console.log(value);
        
    }
    const handleChangePassword = (e) => {
        let value = e.target.value;
        console.log(value);
        
    }
    const handleSubmit =(e) => {
        let validSubmit = false;
        for (let column in temp) {
            if (column.name === handleChangeName.value || column.email === handleChangeEmail.value) {
                try {
                    validSubmit = false;
                } catch (e) {
                    continue
                }
                
            }
            else {
                try {
                validSubmit = true;
                } catch (e) {
                    continue
                }
            }
        }
        checkPass(validSubmit)
        
    }

    return (
        <div className="text-center m-5-auto">
            <h2>inscription</h2>
            <h5>Créer votre compte personnel</h5>
            <form action="/shop">
                <p>
                    <label>Nom</label><br/>
                    <input type="text" name="first_name" required />
                </p>
                <p>
                    <label>Adresse email</label><br/>
                    <input type="email" name="email" required />
                </p>
                <p>
                    <label>Mot de passe</label><br/>
                    <input type="password" name="password" required />
                </p>
                <p>
                    <input type="checkbox" name="checkbox" id="checkbox" required /> <span>J'accepte toutes les déclarations des <a href="https://google.com" target="_blank" rel="noopener noreferrer">termes de service</a></span>.
                </p>
                <p>
                    <button id="sub_btn" type="submit">s'inscrire</button>
                </p>
            </form>
            <footer>
                <p>vous avez déjà un compte compte? <Link to="/login">Connecte-toi</Link>.</p>
                <p><Link to="/">retour à la page d'accueil</Link>.</p>
            </footer>
        </div>
    )

}
const checkPass = (isOk) => {
    if (isOk) {
        temp.push({
            name: SignUpPage.handleChangeName.value,
            email: SignUpPage.handleChangeEmail.value,
            password: SignUpPage.handleChangePassword.value
        });
            return (
                <>
                    <Link to="/shop"></Link>
                </>
            )
    }
}