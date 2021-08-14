import 'dart:io';
import 'dart:convert';
import 'package:Uniplus/models/payment/payment_json_model.dart';
import 'package:Uniplus/models/payment/payment_model.dart';
import 'package:Uniplus/models/plan/planDTO.dart';
import 'package:path_provider/path_provider.dart';

class PaymentController {
  static PaymentController _instance;

  static PaymentController getInstance() {
    if (_instance == null) {
      _instance = new PaymentController();
    }
    return _instance;
  }

  PaymentJsonModel paymentJsonModel;

  void cleanPayment() {
    paymentJsonModel.paymentModel = null;
    paymentJsonModel.planDTO = null;
  }

  Future<File> abreArquivo() async {
    try {
      final diretorio = await getApplicationDocumentsDirectory();
      return File("${diretorio.path}/payment.json");
    } catch (e) {
      return null;
    }
  }

  Future<PaymentJsonModel> lerArquivo() async {
    try {
      final file = await abreArquivo();
      if (file == null) return null;
      var result = json.decode(await file.readAsString());
      final paymentResponse = PaymentJsonModel.fromJsonCardPlan(result);
      paymentJsonModel = paymentResponse;
      return paymentResponse;
    } catch (e) {
      return null;
    }
  }

  Future<bool> deletarArquivo() async {
    try {
      final file = await abreArquivo();
      if (file == null) return null;
      await file.delete();
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<String> salvarPayment(
      PaymentModel paymentModel, PlanDTO planDTO) async {
    try {
      Map<String, dynamic> paymentMap = Map();
      paymentMap["planSelected"] = planDTO;
      paymentMap["cardDetails"] = paymentModel;

      String payment = json.encode(paymentMap);
      final file = await abreArquivo();
      if (file == null) return null;
      await file.writeAsString(payment);
      await lerArquivo();
      return payment;
    } catch (e) {
      return null;
    }
  }

  Future<void> initializePayment() async {
    var file = await abreArquivo();

    if (!await file.exists()) {
      await salvarPayment(null, null);
    } else {
      await lerArquivo();
    }
  }
}
