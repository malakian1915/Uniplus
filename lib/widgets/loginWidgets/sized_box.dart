import 'package:flutter/material.dart';

class SizedBoxLogin extends StatelessWidget {
  double _height;
  double _width;
  Widget _widget;

  SizedBoxLogin({double height, double width, Widget widget}) {
    _height = height;
    _width = width;
    _widget = widget;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _height,
      width: _width,
      child: _widget,
    );
  }
}
