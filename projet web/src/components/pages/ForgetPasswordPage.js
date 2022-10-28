import React from 'react'
import { Link } from 'react-router-dom'

import '../../css/App.css'

export default function ForgetPasswordPage() {
    return (
        <Layout page_title = {page_tit}>
            <div className="text-center m-5-auto">
                <h2>Reset ton mot de passe</h2>
                <h5>Entre ton adresse email</h5>
                <form action="/login">
                    <p>
                        <label id="reset_pass_lbl">Adresse email</label><br/>
                        <input type="email" name="email" required />
                    </p>
                    <p>
                        <button id="sub_btn" type="submit">Send password reset email</button>
                    </p>
                </form>
                <footer>
                    <p>First time? <Link to="/register">Create an account</Link>.</p>
                    <p><Link to="/">Back to Homepage</Link>.</p>
                </footer>
            </div>
        </Layout>
    )
}
