import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class TextFormLogin extends StatelessWidget {
  TextEditingController _controller;
  TextInputType _textInputType;
  bool _obscureText;
  String _labelText;
  ValidationBuilder _validator;

  TextFormLogin(
      {TextEditingController controller,
      TextInputType textInputType,
      bool obscureText,
      String labelText,
      ValidationBuilder validator}) {
    _controller = controller;
    _textInputType = textInputType;
    _obscureText = obscureText;
    _labelText = labelText;
    _validator = validator;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _controller,
      validator: _validator != null ? _validator.build() : null,
      keyboardType: _textInputType,
      obscureText: _obscureText,
      decoration: InputDecoration(
          labelText: _labelText,
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          )),
      style: TextStyle(color: Colors.black, fontSize: 20),
    );
  }
}
