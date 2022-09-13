import 'package:flutter/material.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class AbonnementForm extends StatefulWidget {
  @override
  State<AbonnementForm> createState() => _AbonnementFormState();
}

class _AbonnementFormState extends State<AbonnementForm> {
  String? numAbonnement;
  bool? selectAbo = false;

  void addAbonnement({String? numAbonnement}) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 90,
      width: double.infinity,
      margin: EdgeInsets.all(getProportionateScreenWidth(20)),
      padding: EdgeInsets.symmetric(
        horizontal: getProportionateScreenWidth(20),
        vertical: getProportionateScreenWidth(15),
      ),
      decoration: BoxDecoration(
        color: const Color(0xFF4A3298),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text.rich(
        TextSpan(
          style: const TextStyle(color: Colors.white),
          children: [
            const TextSpan(text: "Le vin Rouge\n"),
            TextSpan(
              text: "Réduction de 20% ",
              style: TextStyle(
                fontSize: getProportionateScreenWidth(24),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
