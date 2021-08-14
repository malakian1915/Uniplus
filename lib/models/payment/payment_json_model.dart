import 'dart:convert';

import 'package:Uniplus/models/payment/payment_model.dart';
import 'package:Uniplus/models/plan/planDTO.dart';

PaymentJsonModel paymentFromJson(String str) =>
    json.decode(str).map((x) => PaymentJsonModel.fromJsonCardPlan(x));

class PaymentJsonModel {
  PaymentJsonModel({PlanDTO planDTO, PaymentModel paymentModel}) {
    _paymentModel = paymentModel;
    _planDTO = planDTO;
  }

  PlanDTO _planDTO;
  PaymentModel _paymentModel;

  PlanDTO get planDTO => this._planDTO;

  set planDTO(value) => this._planDTO = value;

  PaymentModel get paymentModel => this._paymentModel;

  set paymentModel(value) => this._paymentModel = value;

  factory PaymentJsonModel.fromJsonCardPlan(Map<String, dynamic> json) {
    PlanDTO planDto;
    if (json["planSelected"] != null)
      planDto = PlanDTO.fromJson(json["planSelected"]);

    PaymentModel paymentModel;
    if (json["cardDetails"] != null)
      paymentModel = PaymentModel.fromJson(json["cardDetails"]);

    return PaymentJsonModel(planDTO: planDto, paymentModel: paymentModel);
  }
}
