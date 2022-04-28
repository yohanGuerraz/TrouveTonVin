import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:trouvetonvin/screens/sign_in/components/sign_form.dart';
// ignore: import_of_legacy_library_into_null_safe
import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../components/socal_card.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

//Corp de la page Sign_in on y retrouve les Input les erreurs gerer
//et les differents moyens de se connecter
class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text(
                  "Bienvenue",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: getProportionateScreenWidth(28),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Entrer votre mail et mot de passe \nou utiliser l'un des reseaux sociaux ci-dessous",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocalCard(
                      icon: 'assets/icons/google-icon.svg',
                      press: () {},
                      ),
                      SocalCard(
                      icon: 'assets/icons/facebook-2.svg',
                      press: () {},
                      ),
                      SocalCard(
                      icon: 'assets/icons/twitter.svg',
                      press: () {},
                      ),
                  ],
                ),
                SizedBox(height: getProportionateScreenHeight(20)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        "Don't have an account ? ",
                        style: TextStyle(fontSize:getProportionateScreenWidth(16)),
                    ),
                    Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize:getProportionateScreenWidth(16),
                          color: kPrimaryColor,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


