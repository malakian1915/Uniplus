import 'package:Uniplus/controllers/payment/payment_controller.dart';
import 'package:Uniplus/core/routes.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/widgets/shared/appBar/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PlanDetails extends StatefulWidget {
  User _user;
  String _languageCode;

  PlanDetails(this._user, this._languageCode);

  @override
  _PlanDetailsState createState() => _PlanDetailsState();
}

class _PlanDetailsState extends State<PlanDetails> {
  Widget _customSnackBar(String content) {
    return SnackBar(
      backgroundColor: Colors.green,
      content: Text(
        planCanceled.getStringLanguage(widget._languageCode),
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarUniplus(
          widget._user,
          widget._languageCode,
          showLeadingArrow: true,
          showSearchIcon: false,
          showMenu: false,
          cor: Colors.green,
          titleColor: Colors.white,
          title: yourPlan.getStringLanguage(widget._languageCode),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 40, 20, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                    height: 128,
                    width: 150,
                    child: Image.asset("assets/images/Logo/new_logo.png")),
                SizedBox(height: 20),
                Card(
                  color: Colors.white,
                  elevation: 15,
                  child: SizedBox(
                    child: Container(
                      padding: EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Text(
                            PaymentController.getInstance()
                                .paymentJsonModel
                                .planDTO
                                .name,
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                                fontSize: 40),
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                videoQuality
                                    .getStringLanguage(widget._languageCode),
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                PaymentController.getInstance()
                                    .paymentJsonModel
                                    .planDTO
                                    .videoQuality,
                                style: TextStyle(
                                    color: Colors.black54,
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
                                resolution
                                    .getStringLanguage(widget._languageCode),
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                PaymentController.getInstance()
                                    .paymentJsonModel
                                    .planDTO
                                    .resolution,
                                style: TextStyle(
                                    color: Colors.black54,
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
                                  color: Colors.black54,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                PaymentController.getInstance()
                                    .paymentJsonModel
                                    .planDTO
                                    .screens,
                                style: TextStyle(
                                    color: Colors.black54,
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
                                price.getStringLanguage(widget._languageCode) +
                                    ": ",
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                moneyCode.getStringLanguage(
                                        widget._languageCode) +
                                    PaymentController.getInstance()
                                        .paymentJsonModel
                                        .planDTO
                                        .price
                                        .toString(),
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  children: [
                    Column(
                      children: [
                        ClipOval(
                          child: Material(
                            color: Colors.green,
                            child: InkWell(
                              splashColor: Colors.greenAccent,
                              child: SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Icon(Icons.payment)),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  Routes().getInstance().routeToAlterPayment(
                                      widget._user, widget._languageCode),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          paymentMethod.getStringLanguage(widget._languageCode),
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        ClipOval(
                          child: Material(
                            color: Colors.blue,
                            child: InkWell(
                              splashColor: Colors.blueAccent,
                              child: SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Icon(Icons.contacts)),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  Routes().getInstance().routeToPlans(
                                      widget._user,
                                      widget._languageCode,
                                      PaymentController.getInstance()
                                          .paymentJsonModel
                                          .planDTO
                                          .name),
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          alterPlan.getStringLanguage(widget._languageCode),
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        ClipOval(
                          child: Material(
                            color: Colors.red,
                            child: InkWell(
                              splashColor: Colors.redAccent,
                              child: SizedBox(
                                  width: 70,
                                  height: 70,
                                  child: Icon(Icons.close)),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.lightGreen,
                                      title: Text(cancelTitle.getStringLanguage(
                                          widget._languageCode)),
                                      content: SingleChildScrollView(
                                        child: ListBody(
                                          children: <Widget>[
                                            Text(
                                                cancelMessage.getStringLanguage(
                                                    widget._languageCode)),
                                          ],
                                        ),
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          child: Text(
                                            cancelPlanNo.getStringLanguage(
                                                widget._languageCode),
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                        TextButton(
                                          child: Text(
                                            cancelPlanYes.getStringLanguage(
                                                widget._languageCode),
                                            style: TextStyle(
                                              color: Colors.red,
                                            ),
                                          ),
                                          onPressed: () {
                                            PaymentController.getInstance()
                                                .deletarArquivo();
                                            PaymentController.getInstance()
                                                .cleanPayment();

                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              _customSnackBar(
                                                firebaseTooManyRequests
                                                    .getStringLanguage(
                                                        widget._languageCode),
                                              ),
                                            );

                                            Navigator.pushAndRemoveUntil(
                                                context,
                                                Routes()
                                                    .getInstance()
                                                    .routeToHomeView(
                                                        widget._user),
                                                (Route<dynamic> route) =>
                                                    false);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          cancelPlan.getStringLanguage(widget._languageCode),
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
