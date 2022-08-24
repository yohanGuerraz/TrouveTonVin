import React from 'react'
import { Link } from 'react-router-dom'
import temp from '../../App'
import '../../App.css'

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
            <h2>Join us</h2>
            <h5>Create your personal account</h5>
            <form>
                <p>
                    <label>Username</label><br/>
                    <input type="text" name="first_name" onChange={handleChangeName} required />
                </p>
                <p>
                    <label>Email address</label><br/>
                    <input type="email" name="email" onChange={handleChangeEmail} required />
                </p>
                <p>
                    <label>Password</label><br/>
                    <input type="password" name="password" onChange={handleChangePassword} required />
                </p>
                <p>
                    <input type="checkbox" name="checkbox" id="checkbox" required /> <span>I agree all statements in <a href="https://google.com" target="_blank" rel="noopener noreferrer">terms of service</a></span>.
                </p>
                <p>
                    <button id="sub_btn" onClick={handleSubmit} type="submit">Register</button>
                </p>
            </form>
            <footer>
                <p><Link to="/">Back to Homepage</Link>.</p>
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