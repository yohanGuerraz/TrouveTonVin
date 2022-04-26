import 'package:flutter/material.dart';

import '../../../size_config.dart';

class Body extends StatelessWidget {
  const Body({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizeBox(
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
          ],
        ),
      ),
    );
  }
}