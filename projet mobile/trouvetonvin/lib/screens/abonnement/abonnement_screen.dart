import 'package:flutter/material.dart';

import 'components/body.dart';

class AbonnementScreen extends StatelessWidget {
  static String routeName = "/abonnement";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Abonnement'),
      ),
      body: Body(),
    );
  }
}
