import 'package:flutter/material.dart';

import 'components/body.dart';

class ListProduitScreen extends StatelessWidget {
  static String routeName = "/list_produit";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Produit"),
      ),
      body: Body(),
    );
  }
}
