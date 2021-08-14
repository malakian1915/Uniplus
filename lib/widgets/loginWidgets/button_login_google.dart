import 'package:Uniplus/controllers/authentication/authentication_controller.dart';
import 'package:Uniplus/core/routes.dart';
import 'package:Uniplus/views/home/home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ButtonLoginGoogle extends StatefulWidget {
  String _buttonText;

  ButtonLoginGoogle(buttonText) {
    _buttonText = buttonText;
  }

  @override
  ButtonSignInGoogle createState() => ButtonSignInGoogle();
}

class ButtonSignInGoogle extends State<ButtonLoginGoogle> {
  bool _isSigningIn = false;
  String _buttonText;

  @override
  void initState() {
    _buttonText = widget._buttonText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _isSigningIn
        ? SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          )
        : OutlineButton(
            splashColor: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            highlightElevation: 0,
            borderSide: BorderSide(color: Colors.green),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/images/LoginButtons/Google_G_Logo.png",
                    width: 30,
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      _buttonText,
                      style: TextStyle(fontSize: 20, color: Colors.green),
                    ),
                  )
                ],
              ),
            ),
            onPressed: () {
              _realizarLoginGoogle();
            });
  }

  void _realizarLoginGoogle() async {
    try {
      setState(() {
        _isSigningIn = true;
      });

      User user = await AuthenticationController()
          .getInstance()
          .signInWithGoogle(context: context);

      setState(() {
        _isSigningIn = false;
      });

      if (user != null) {
        Navigator.of(context)
            .pushReplacement(Routes().getInstance().routeToHomeView(user));
      }
    } on Exception catch (error) {
      await AuthenticationController().getInstance().signOut(context: context);

      setState(() {
        _isSigningIn = false;
      });
    }
  }
}
