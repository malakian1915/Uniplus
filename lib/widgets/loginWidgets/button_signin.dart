import 'package:Uniplus/controllers/authentication/authentication_controller.dart';
import 'package:Uniplus/core/routes.dart';
import 'package:Uniplus/views/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ButtonSignin extends StatefulWidget {
  TextEditingController _controllerEmail;
  TextEditingController _controllerPassword;
  bool _resetPassword = false;
  bool _createAccount = false;
  String _buttonText;

  var _formKey = GlobalKey<FormState>();

  ButtonSignin(
      {TextEditingController controllerEmail,
      TextEditingController controllerPassword,
      GlobalKey<FormState> formKey,
      bool resetPassword,
      bool createAccount,
      String buttonText}) {
    _controllerEmail = controllerEmail;
    _controllerPassword = controllerPassword;
    _formKey = formKey;
    _resetPassword = resetPassword;
    _createAccount = createAccount;
    _buttonText = buttonText;
  }

  @override
  ButtonSigIn createState() => ButtonSigIn();
}

class ButtonSigIn extends State<ButtonSignin> {
  bool _isSigningIn = false;
  bool _resetPassword = false;
  bool _createAccount = false;
  String _buttonText;

  TextEditingController _controllerEmail;
  TextEditingController _controllerPassword;

  var _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _controllerEmail = widget._controllerEmail;
    _controllerPassword = widget._controllerPassword;
    _formKey = widget._formKey;
    _resetPassword = widget._resetPassword;
    _createAccount = widget._createAccount;
    _buttonText = widget._buttonText;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isSigningIn
        ? SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          )
        : GestureDetector(
            onTap: () {
              if (_createAccount) {
                _createAccountMethod(
                    _controllerEmail.text, _controllerPassword.text);
              } else if (_resetPassword) {
                _resetPasswordEmail(_controllerEmail.text);
              } else {
                _realizarLogin(
                    _controllerEmail.text, _controllerPassword?.text ?? "");
              }
            },
            child: Container(
              height: 60,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [0.3, 1],
                  colors: [
                    Color(0xFF5CB85C),
                    Color(0XFF77DD77),
                  ],
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Text(
                _buttonText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ));
  }

  void _realizarLogin(String email, String password) async {
    try {
      if (_formKey.currentState.validate()) {
        setState(() {
          _isSigningIn = true;
        });

        User user = await AuthenticationController()
            .getInstance()
            .signInWithEmailAndPassword(email.trim(), password.trim(),
                context: context);

        setState(() {
          _isSigningIn = false;
        });

        if (user != null) {
          Navigator.of(context).pushReplacement(
            Routes().getInstance().routeToHomeView(user),
          );
        }
      }
    } on Exception catch (error) {
      await AuthenticationController().getInstance().signOut(context: context);

      setState(() {
        _isSigningIn = false;
      });
    }
  }

  void _resetPasswordEmail(String email) async {
    try {
      if (_formKey.currentState.validate()) {
        setState(() {
          _isSigningIn = true;
        });

        await AuthenticationController()
            .getInstance()
            .resetPassword(email.trim(), context: context);

        setState(() {
          _isSigningIn = false;
        });
      }
    } on Exception catch (error) {
      setState(() {
        _isSigningIn = false;
      });
    }
  }

  void _createAccountMethod(String email, String senha) async {
    try {
      if (_formKey.currentState.validate()) {
        setState(() {
          _isSigningIn = true;
        });

        await AuthenticationController()
            .getInstance()
            .createAccount(email.trim(), senha.trim(), context: context);

        setState(() {
          _isSigningIn = false;
        });
      }
    } on Exception catch (error) {
      setState(() {
        _isSigningIn = false;
      });
    }
  }
}
