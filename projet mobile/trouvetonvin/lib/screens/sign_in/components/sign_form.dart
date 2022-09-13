import 'package:flutter/material.dart';
import '../../../helper/keyboard.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../login_success/login_success_screen.dart';
import '../../../components/custom_surfix_icon.dart';
import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:http/http.dart' as http;

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool? remember = false;
  final List<String?> errors = [];

  var emailControlle = TextEditingController();
  var mdpControlle = TextEditingController();

////////////////////////////////////////////////////////////////////////////////////////////////
  /// Fonction permettant de gérer et afficher les erreurs
////////////////////////////////////////////////////////////////////////////////////////////////
  void addError({String? error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// Fonction permettant de gérer et effacer les erreurs
////////////////////////////////////////////////////////////////////////////////////////////////
  void removeError({String? error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              /// structure de la checkbox "se souvenir de moi"
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
                login();
                //Navigator.pushNamed(context, LoginSuccessScreen.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// structure de l'input Mot de passe avec gestion d'erreurs
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
        return null;
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
  /// structure de l'input email avec gestion d'erreurs
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
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }

////////////////////////////////////////////////////////////////////////////////////////////////
  /// Fontion permettant de vérifier si l'utilisateur existe ou non dans la bdd
////////////////////////////////////////////////////////////////////////////////////////////////
  Future<void> login() async {
    if (mdpControlle.text.isNotEmpty && emailControlle.text.isNotEmpty) {
      var reponse = await http.post(Uri.parse(""),
          body: ({'email': emailControlle.text, 'mdp': mdpControlle.text}));
      if (reponse.statusCode == 200) {
        Navigator.pushNamed(context, LoginSuccessScreen.routeName);
      } else {
        addError(error: kErrorConnexion);
      }
    }
  }
}
