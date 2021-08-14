import 'package:flutter/material.dart';

class TitleCards extends StatelessWidget {
  String _title;

  TitleCards(String title) {
    _title = title;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
      width: MediaQuery.of(context).size.width * 1,
      child: Text(
        _title,
        style: TextStyle(
          backgroundColor: Colors.black,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
