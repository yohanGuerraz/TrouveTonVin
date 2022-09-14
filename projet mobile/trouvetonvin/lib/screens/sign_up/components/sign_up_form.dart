import 'package:flutter/material.dart';
import 'package:trouvetonvin/components/custom_surfix_icon.dart';
import 'package:trouvetonvin/components/default_button.dart';
import 'package:trouvetonvin/components/form_error.dart';

import '../../../constants.dart';
import '../../../size_config.dart';
import '../../sign_in/sign_in_screen.dart';

import 'package:http/http.dart' as http;

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? conform_password;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;
  String? codePostal;
  bool remember = false;
  final List<String?> errors = [];

  var emailControlle = TextEditingController();
  var mdpControlle = TextEditingController();
  var firstNameControlle = TextEditingController();
  var lastNameControlle = TextEditingController();
  var phoneNumberControlle = TextEditingController();
  var addressControlle = TextEditingController();
  var codePostalControlle = TextEditingController();

////////////////////////////////////////////////////////////////////////////////////////////////
  /// fonction permettant d'afficher les message d'erreurs
////////////////////////////////////////////////////////////////////////////////////////////////

  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// fonction permettant d'effacer les message d'erreurs
////////////////////////////////////////////////////////////////////////////////////////////////

  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// structure permettant d'afficher tous les input ainsi que les messages d'erreurs
////////////////////////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildConformPassFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildCodePostalFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            text: "Enregistrer",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                Navigator.pushNamed(context, SignInScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// structure de l'input code postal avec gestion d'erreurs
////////////////////////////////////////////////////////////////////////////////////////////////

  TextFormField buildCodePostalFormField() {
    return TextFormField(
      controller: codePostalControlle,
      onSaved: (newValue) => codePostal = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kErrorcodePostal);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kErrorcodePostal);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Code Postal",
        hintText: "Enter your phone address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// structure de l'input adresse avec gestion d'erreurs
////////////////////////////////////////////////////////////////////////////////////////////////

  TextFormField buildAddressFormField() {
    return TextFormField(
      controller: addressControlle,
      onSaved: (newValue) => address = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// structure de l'input numero de telephone avec gestion d'erreurs
////////////////////////////////////////////////////////////////////////////////////////////////

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      controller: phoneNumberControlle,
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// structure de l'input nom avec gestion d'erreurs
////////////////////////////////////////////////////////////////////////////////////////////////

  TextFormField buildLastNameFormField() {
    return TextFormField(
      controller: lastNameControlle,
      onSaved: (newValue) => lastName = newValue,
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// structure de l'input prenom avec gestion d'erreurs
////////////////////////////////////////////////////////////////////////////////////////////////

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      controller: firstNameControlle,
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// structure de l'input mot de passe avec gestion d'erreurs
////////////////////////////////////////////////////////////////////////////////////////////////

  TextFormField buildConformPassFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => conform_password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.isNotEmpty && password == conform_password) {
          removeError(error: kMatchPassError);
        }
        conform_password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if ((password != value)) {
          addError(error: kMatchPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Re-enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// structure de l'input mot de passe avec gestion d'erreurs
////////////////////////////////////////////////////////////////////////////////////////////////

  TextFormField buildPasswordFormField() {
    return TextFormField(
      controller: mdpControlle,
      obscureText: true,
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        password = value;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// structure de l'input mail avec gestion d'erreurs
////////////////////////////////////////////////////////////////////////////////////////////////

  TextFormField buildEmailFormField() {
    return TextFormField(
      controller: emailControlle,
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// Fontion permettant de creer un compte utilisateur dans la bdd
////////////////////////////////////////////////////////////////////////////////////////////////
  Future<void> createAccount() async {
    if (mdpControlle.text.isNotEmpty && emailControlle.text.isNotEmpty) {
      var reponse = await http.post(Uri.parse(""),
          body: ({
            'prenom': firstNameControlle.text,
            'nom': lastNameControlle.text,
            'email': emailControlle.text,
            'mdp': mdpControlle.text,
            'telephone': phoneNumberControlle.text,
            'adresse': addressControlle.text,
            'codePostale': codePostalControlle.text
          }));
      if (reponse.statusCode == 200) {
        Navigator.pushNamed(context, SignInScreen.routeName);
      } else {
        addError(error: kErrorConnexion);
      }
    }
  }
}
