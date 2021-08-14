import 'package:Uniplus/controllers/payment/payment_controller.dart';
import 'package:Uniplus/core/routes.dart';
import 'package:Uniplus/models/payment/payment_model.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/widgets/shared/appBar/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:toggle_switch/toggle_switch.dart';

class AlterPayment extends StatefulWidget {
  User _user;
  String _languageCode;

  AlterPayment(this._user, this._languageCode);

  @override
  _AlterPaymentState createState() => _AlterPaymentState();
}

class _AlterPaymentState extends State<AlterPayment> {
  final _controllerCardNumber = new TextEditingController();
  final _controllerCardName = new TextEditingController();
  final _controllerCardExpiryDate = new TextEditingController();
  final _controllerCVC = new TextEditingController();
  bool _debito = true;
  String _paymentMethod;
  bool _isPaying = false;
  bool _readOnly = true;

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    var cardNumber = PaymentController.getInstance()
        .paymentJsonModel
        .paymentModel
        .cardNumber
        .toString()
        .substring(12);
    _controllerCardNumber.text = "************" + cardNumber;
    _controllerCardName.text =
        PaymentController.getInstance().paymentJsonModel.paymentModel.cardName;
    _controllerCardExpiryDate.text = PaymentController.getInstance()
        .paymentJsonModel
        .paymentModel
        .cardExpiryDate;
    var cvc = PaymentController.getInstance()
        .paymentJsonModel
        .paymentModel
        .cardCVC
        .toString()
        .substring(2);
    _controllerCVC.text = "**" + cvc;

    var paymentMethod = PaymentController.getInstance()
        .paymentJsonModel
        .paymentModel
        .debitCredit;
    if (paymentMethod == "Debit" || paymentMethod == "Débito") {
      _debito = true;
      _paymentMethod = paymentMethod;
    } else {
      _debito = false;
      _paymentMethod = paymentMethod;
    }

    super.initState();
  }

  Widget _textFormField(
      {TextEditingController controller,
      TextInputType textInputType,
      bool obscureText,
      String labelText,
      int maxLength,
      ValidationBuilder validator}) {
    return TextFormField(
      controller: controller,
      validator: validator != null ? validator.build() : null,
      maxLength: maxLength != null ? maxLength : null,
      keyboardType: textInputType,
      obscureText: obscureText,
      readOnly: _readOnly,
      decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.black38,
            fontWeight: FontWeight.w400,
            fontSize: 20,
          )),
      style: TextStyle(color: Colors.black, fontSize: 20),
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
          title: payment.getStringLanguage(widget._languageCode),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(30, 40, 30, 10),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                      height: 128,
                      width: 150,
                      child: Image.asset("assets/images/Logo/new_logo.png")),
                  SizedBox(height: 20),
                  _textFormField(
                      controller: _controllerCardNumber,
                      textInputType: TextInputType.number,
                      maxLength: 16,
                      obscureText: false,
                      labelText:
                          cardNumber.getStringLanguage(widget._languageCode),
                      validator: ValidationBuilder()
                          .minLength(
                              16,
                              cardNumberValid
                                  .getStringLanguage(widget._languageCode))
                          .maxLength(
                              16,
                              cardNumberValid
                                  .getStringLanguage(widget._languageCode))
                          .required(fieldFilled
                              .getStringLanguage(widget._languageCode))),
                  _textFormField(
                      controller: _controllerCardName,
                      textInputType: TextInputType.text,
                      obscureText: false,
                      labelText:
                          cardName.getStringLanguage(widget._languageCode),
                      validator: ValidationBuilder().add((value) {
                        if (value.isNotEmpty)
                          return null;
                        else
                          return fieldFilled
                              .getStringLanguage(widget._languageCode);
                      }).required(
                          fieldFilled.getStringLanguage(widget._languageCode))),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: _textFormField(
                            controller: _controllerCardExpiryDate,
                            textInputType: TextInputType.datetime,
                            obscureText: false,
                            maxLength: 5,
                            labelText: cardExpiryDate
                                .getStringLanguage(widget._languageCode),
                            validator: ValidationBuilder()
                                .minLength(
                                    5,
                                    cardExpiryDateValid.getStringLanguage(
                                        widget._languageCode))
                                .maxLength(
                                    5,
                                    cardExpiryDateValid.getStringLanguage(
                                        widget._languageCode))
                                .required(fieldFilled
                                    .getStringLanguage(widget._languageCode))),
                      ),
                      SizedBox(width: 50),
                      Expanded(
                        child: _textFormField(
                            controller: _controllerCVC,
                            textInputType: TextInputType.number,
                            obscureText: false,
                            maxLength: 3,
                            labelText:
                                cardCVC.getStringLanguage(widget._languageCode),
                            validator: ValidationBuilder()
                                .minLength(
                                    3,
                                    cardCVCValid.getStringLanguage(
                                        widget._languageCode))
                                .maxLength(
                                    3,
                                    cardCVCValid.getStringLanguage(
                                        widget._languageCode))
                                .required(fieldFilled
                                    .getStringLanguage(widget._languageCode))),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  _readOnly
                      ? Text(
                          _paymentMethod,
                          style: TextStyle(color: Colors.black45, fontSize: 30),
                        )
                      : ToggleSwitch(
                          minWidth: MediaQuery.of(context).size.width - 250,
                          cornerRadius: 20.0,
                          activeBgColor: Colors.green[400],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.grey,
                          inactiveFgColor: Colors.white,
                          fontSize: 18,
                          initialLabelIndex: _debito ? 0 : 1,
                          labels: [
                            debit.getStringLanguage(widget._languageCode),
                            credit.getStringLanguage(widget._languageCode)
                          ],
                          onToggle: (index) {
                            if (!_readOnly) {
                              if (index == 0)
                                _debito = true;
                              else if (index == 1) _debito = false;
                            }
                          },
                        ),
                  SizedBox(height: 40),
                  GestureDetector(
                    onTap: () async {
                      if (_readOnly) {
                        setState(() {
                          _readOnly = false;
                        });
                      } else if (_formKey.currentState.validate()) {
                        setState(() {
                          _isPaying = true;
                        });

                        var _paymentModel = new PaymentModel(
                          cardNumber: _controllerCardNumber.text,
                          cardName: _controllerCardName.text,
                          cardExpiryDate: _controllerCardExpiryDate.text,
                          cardCVC: _controllerCVC.text,
                          debitCredit: _debito
                              ? debit.getStringLanguage(widget._languageCode)
                              : credit.getStringLanguage(widget._languageCode),
                        );

                        PaymentController.getInstance().salvarPayment(
                            _paymentModel,
                            PaymentController.getInstance()
                                .paymentJsonModel
                                .planDTO);

                        await Future.delayed(Duration(seconds: 2));

                        setState(() {
                          _isPaying = false;
                        });

                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.lightGreen,
                              title: Text(
                                  paymentMethodChanged
                                      .getStringLanguage(widget._languageCode),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                              content: SingleChildScrollView(
                                child: ListBody(
                                  children: <Widget>[
                                    Text(
                                        paymentCancelOrChange.getStringLanguage(
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
                                            .routeToHomeView(widget._user),
                                        (Route<dynamic> route) => false);
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    child: _isPaying
                        ? SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              valueColor:
                                  AlwaysStoppedAnimation<Color>(Colors.green),
                            ),
                          )
                        : Container(
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
                              _readOnly
                                  ? alterCard
                                      .getStringLanguage(widget._languageCode)
                                  : save
                                      .getStringLanguage(widget._languageCode),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
