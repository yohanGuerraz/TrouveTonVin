import 'package:flutter/material.dart';

import '../../accounts_profil/accounts_profil_screen.dart';
import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "Mon compte",
            icon: "assets/icons/User Icon.svg",
            press: () =>
                Navigator.pushNamed(context, AccountProfilScreen.routeName),
          ),
          ProfileMenu(
            text: "Abonnement",
            icon: "assets/icons/Gift Icon.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Paramettre",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "assets/icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Deconnexion",
            icon: "assets/icons/Log out.svg",
            press: () {},
          ),
        ],
      ),
    );
  }
}
