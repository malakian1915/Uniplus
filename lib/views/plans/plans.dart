import 'package:Uniplus/controllers/payment/payment_controller.dart';
import 'package:Uniplus/core/routes.dart';
import 'package:Uniplus/models/plan/planDTO.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/widgets/shared/appBar/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Plans extends StatefulWidget {
  User _user;
  String _languageCode;
  String _currentPlan;

  Plans(this._user, this._languageCode, this._currentPlan);

  @override
  _PlansState createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  bool uniLight = false;
  bool uniPlus = false;
  bool uniPremium = true;
  bool _isSaving = false;

  @override
  void initState() {
    if (widget._currentPlan != null) {
      if (widget._currentPlan == "UniLight") {
        uniLight = true;
        uniPlus = false;
        uniPremium = false;
      } else if (widget._currentPlan == "UniPlus") {
        uniLight = false;
        uniPlus = true;
        uniPremium = false;
      } else if (widget._currentPlan == "UniPremium") {
        uniLight = false;
        uniPlus = false;
        uniPremium = true;
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String _name = uniLight
        ? "UniLight"
        : uniPlus
            ? "UniPlus"
            : "UniPremium";
    String _videoQuality = uniLight
        ? good.getStringLanguage(widget._languageCode)
        : uniPlus
            ? better.getStringLanguage(widget._languageCode)
            : best.getStringLanguage(widget._languageCode);
    String _resolution = uniLight
        ? "480p"
        : uniPlus
            ? "1080p"
            : "4K + HDR";
    String _screens = uniLight
        ? one.getStringLanguage(widget._languageCode)
        : uniPlus
            ? two.getStringLanguage(widget._languageCode)
            : threeFive.getStringLanguage(widget._languageCode);
    double _price = uniLight
        ? double.parse(basicPrice
            .getStringLanguage(widget._languageCode)
            .replaceAll(',', '.'))
        : uniPlus
            ? double.parse(standardPrice
                .getStringLanguage(widget._languageCode)
                .replaceAll(',', '.'))
            : double.parse(bestPrice
                .getStringLanguage(widget._languageCode)
                .replaceAll(',', '.'));

    var planDTO = new PlanDTO(
        name: _name,
        videoQuality: _videoQuality,
        resolution: _resolution,
        screens: _screens,
        price: _price);

    return SafeArea(
      child: Scaffold(
        appBar: AppBarUniplus(
          widget._user,
          widget._languageCode,
          showLeadingArrow: true,
          showSearchIcon: false,
          showMenu: false,
          cor: Colors.green,
          titleColor: Colors.white,
          title: choosePlan.getStringLanguage(widget._languageCode),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.4, 1],
                      colors: [
                        Color(0xFF5CB85C),
                        Color(0XFF00FF7F),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        planDTO.name,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            fontSize: 40),
                      ),
                      SizedBox(
                        height: 128,
                        width: 150,
                        child: Image.asset("assets/images/Logo/new_logo.png"),
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            videoQuality
                                .getStringLanguage(widget._languageCode),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            planDTO.videoQuality,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            resolution.getStringLanguage(widget._languageCode),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            planDTO.resolution,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            screens.getStringLanguage(widget._languageCode),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            planDTO.screens,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          uniLight = true;
                          uniPlus = false;
                          uniPremium = false;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: uniLight ? Colors.red : Colors.black45,
                              width: uniLight ? 2.5 : 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              basic
                                  .getStringLanguage(widget._languageCode)
                                  .toUpperCase(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(height: 50),
                            Text(
                              moneyCode
                                      .getStringLanguage(widget._languageCode) +
                                  basicPrice
                                      .getStringLanguage(widget._languageCode),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23),
                            ),
                            Text(
                              monthly.getStringLanguage(widget._languageCode),
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          uniLight = false;
                          uniPlus = true;
                          uniPremium = false;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: uniPlus ? Colors.red : Colors.black45,
                              width: uniPlus ? 2.5 : 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              standard
                                  .getStringLanguage(widget._languageCode)
                                  .toUpperCase(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(height: 50),
                            Text(
                              moneyCode
                                      .getStringLanguage(widget._languageCode) +
                                  standardPrice
                                      .getStringLanguage(widget._languageCode),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23),
                            ),
                            Text(
                              monthly.getStringLanguage(widget._languageCode),
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          uniLight = false;
                          uniPlus = false;
                          uniPremium = true;
                        });
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width / 3,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: uniPremium ? Colors.red : Colors.black45,
                              width: uniPremium ? 2.5 : 1),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Text(
                              best
                                  .getStringLanguage(widget._languageCode)
                                  .toUpperCase(),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            SizedBox(height: 50),
                            Text(
                              moneyCode
                                      .getStringLanguage(widget._languageCode) +
                                  bestPrice
                                      .getStringLanguage(widget._languageCode),
                              style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23),
                            ),
                            Text(
                              monthly.getStringLanguage(widget._languageCode),
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: _isSaving
                      ? SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.green),
                          ),
                        )
                      : GestureDetector(
                          onTap: () async {
                            if (widget._currentPlan != null) {
                              setState(() {
                                _isSaving = true;
                              });

                              PaymentController.getInstance().salvarPayment(
                                  PaymentController.getInstance()
                                      .paymentJsonModel
                                      .paymentModel,
                                  planDTO);

                              await Future.delayed(Duration(seconds: 2));

                              setState(() {
                                _isSaving = false;
                              });

                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.lightGreen,
                                    title: Text(
                                        planChangedTitle.getStringLanguage(
                                            widget._languageCode),
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)),
                                    content: SingleChildScrollView(
                                      child: ListBody(
                                        children: <Widget>[
                                          Text(
                                              planChangedMessage
                                                  .getStringLanguage(
                                                      widget._languageCode),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                    ),
                                    actions: <Widget>[
                                      TextButton(
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        onPressed: () {
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              Routes()
                                                  .getInstance()
                                                  .routeToHomeView(
                                                      widget._user),
                                              (Route<dynamic> route) => false);
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              Navigator.of(context).push(
                                Routes().getInstance().routeToPayment(
                                    widget._user,
                                    widget._languageCode,
                                    planDTO),
                              );
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
                                Radius.circular(30),
                              ),
                            ),
                            child: Text(
                              widget._currentPlan != null
                                  ? save.getStringLanguage(widget._languageCode)
                                  : continueLabel
                                      .getStringLanguage(widget._languageCode),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
