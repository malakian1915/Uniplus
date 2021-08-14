import 'dart:convert';

PaymentModel paymentFromJson(String str) =>
    json.decode(str).map((x) => PaymentModel.fromJson(x));

class PaymentModel {
  PaymentModel({cardNumber, cardName, cardExpiryDate, cardCVC, debitCredit}) {
    _cardNumber = cardNumber;
    _cardName = cardName;
    _cardExpiryDate = cardExpiryDate;
    _cardCVC = cardCVC;
    _debitCredit = debitCredit;
  }

  String _cardNumber;
  String _cardName;
  String _cardExpiryDate;
  String _cardCVC;
  String _debitCredit;

  get cardNumber => this._cardNumber;

  set cardNumber(value) => this._cardNumber = value;

  get cardName => this._cardName;

  set cardName(value) => this._cardName = value;

  get cardExpiryDate => this._cardExpiryDate;

  set cardExpiryDate(value) => this._cardExpiryDate = value;

  get cardCVC => this._cardCVC;

  set cardCVC(value) => this._cardCVC = value;

  get debitCredit => this._debitCredit;

  set debitCredit(value) => this._debitCredit = value;

  Map toJson() => {
        "cardNumber": cardNumber,
        "cardName": cardName,
        "cardExpiryDate": cardExpiryDate,
        "cardCVC": cardCVC,
        "debitCredit": debitCredit
      };

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        cardNumber: json["cardNumber"],
        cardName: json["cardName"],
        cardExpiryDate: json["cardExpiryDate"],
        cardCVC: json["cardCVC"],
        debitCredit: json["debitCredit"],
      );
}
