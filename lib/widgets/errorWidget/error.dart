import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  String _error;
  Widget _widget;

  Error(String error, Widget widget) {
    _error = error;
    _widget = widget;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 300,
                  height: 300,
                  child: _widget,
                ),
                SizedBox(height: 10),
                Text(
                  _error,
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
