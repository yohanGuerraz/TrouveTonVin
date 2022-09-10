import 'package:flutter/material.dart';

import 'components/body.dart';

class AccountProfilScreen extends StatelessWidget {
  static String routeName = "/account_profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
      ),
      body: Body(),
    );
  }
}
