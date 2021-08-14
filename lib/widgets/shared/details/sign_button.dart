import 'package:Uniplus/core/routes.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignButton extends StatelessWidget {
  String _languageCode;
  User _user;

  SignButton(this._user, this._languageCode);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            Routes().getInstance().routeToPlans(_user, _languageCode, null));
      },
      child: Container(
        height: 60,
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
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
            Radius.circular(30),
          ),
        ),
        child: Text(
          signForFullContent.getStringLanguage(_languageCode),
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
