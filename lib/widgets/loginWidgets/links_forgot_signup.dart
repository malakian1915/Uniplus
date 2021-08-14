import 'package:Uniplus/core/routes.dart';
import 'package:Uniplus/views/login/createAccount/create_account.dart';
import 'package:Uniplus/views/login/resetPassword/reset_password.dart';
import 'package:flutter/material.dart';

class LinksForgotSignup extends StatelessWidget {
  AlignmentGeometry _alignmentGeometry;
  String _label;
  TextStyle _textStyle;
  bool _forgot;

  LinksForgotSignup(AlignmentGeometry alignmentGeometry, String label,
      TextStyle textStyle, bool forgot) {
    _alignmentGeometry = alignmentGeometry;
    _label = label;
    _textStyle = textStyle;
    _forgot = forgot;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: _alignmentGeometry,
      child: GestureDetector(
        child: Text(
          _label,
          style: _textStyle,
        ),
        onTap: () {
          if (_forgot) {
            Navigator.push(
              context,
              Routes().getInstance().routeToResetPassword(),
            );
          } else {
            Navigator.push(
              context,
              Routes().getInstance().routeToCreateAccount(),
            );
          }
        },
      ),
    );
  }
}
