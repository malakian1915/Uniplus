import 'package:Uniplus/translations/translations.dart';
import 'package:flutter/material.dart';

class LikesWidget extends StatelessWidget {
  int _voteCount;
  String _languageCode;

  LikesWidget(this._voteCount, this._languageCode);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Row(
            children: [
              IconButton(
                iconSize: 40,
                icon: Image.asset(
                  "assets/images/Icons/like.png",
                ),
                onPressed: () {},
              ),
              Text(
                _voteCount.toString(),
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 5, 10, 0),
          child: Text(
            voteCount.getStringLanguage(_languageCode),
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
