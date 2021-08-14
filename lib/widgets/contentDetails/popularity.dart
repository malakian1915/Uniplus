import 'package:Uniplus/translations/translations.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class PopularidadeWidget extends StatelessWidget {
  String _languageCode;
  double _voteAverage;

  PopularidadeWidget(this._voteAverage, this._languageCode);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: CircularPercentIndicator(
            radius: 60.0,
            lineWidth: 5.0,
            percent: _getPercent(),
            center: Text(
              _voteAverage.toString().replaceAll('.', '') + "%",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            progressColor: Colors.green,
          ),
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(10, 5, 0, 0),
          child: Text(
            popularity.getStringLanguage(_languageCode),
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }

  double _getPercent() {
    if (_voteAverage.toString() == "10.0") return 1;

    dynamic porcentString =
        ("0." + _voteAverage.toString().replaceAll('.', ''));

    return double.parse(porcentString);
  }
}
