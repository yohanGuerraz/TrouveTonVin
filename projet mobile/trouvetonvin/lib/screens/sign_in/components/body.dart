import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text("Bienvenue", style: TextStyle(
              color: Colors.black, 
              fontSize: getProportionateScreenWidth(28),
              fontWeight: FontWeight.bold,
              ),
              ),
            Text(
              "Entrer votre mail et mot de passe \nou utiliser l'un des reseaux sociaux ci-dessous",
              textAlign: TextAlign.center,
            ),
            SignForm(),
          ],
        ),
      ),
    );
  }
}

class SignForm extends StatefulWidget {
  const SignForm({ Key? key }) : super(key: key);

  @override
  State<SignForm> createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}