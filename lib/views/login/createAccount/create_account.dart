import 'package:Uniplus/controllers/language/language_controller.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/widgets/loginWidgets/button_signin.dart';
import 'package:Uniplus/widgets/loginWidgets/sized_box.dart';
import 'package:Uniplus/widgets/loginWidgets/text_form_login.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class CreateAccount extends StatelessWidget {
  final _controllerEmail = new TextEditingController();
  final _controllerPassword = new TextEditingController();
  final _controllerPasswordConfirm = new TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String languageCode;
  Future<String> _loadLanguage() async {
    var language = await LanguageController().getInstance().lerArquivo();
    languageCode = language.replaceAll("-", "_");
    return language ?? null;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadLanguage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: AppBar(
                  backgroundColor: Colors.green,
                  centerTitle: true,
                  title: Text(joinWithUs.getStringLanguage(languageCode)),
                ),
                body: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(left: 30, right: 30),
                    height: MediaQuery.of(context).size.height,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SizedBoxLogin(
                              height: 128,
                              width: 150,
                              widget: Image.asset(
                                  "assets/images/Logo/new_logo.png")),
                          SizedBoxLogin(height: 20),
                          TextFormLogin(
                              controller: _controllerEmail,
                              textInputType: TextInputType.emailAddress,
                              obscureText: false,
                              labelText:
                                  loginEmail.getStringLanguage(languageCode),
                              validator: ValidationBuilder()
                                  .email(emailIsValid
                                      .getStringLanguage(languageCode))
                                  .required(fieldFilled
                                      .getStringLanguage(languageCode))),
                          SizedBoxLogin(height: 10),
                          TextFormLogin(
                              controller: _controllerPassword,
                              textInputType: TextInputType.text,
                              obscureText: true,
                              labelText:
                                  loginSenha.getStringLanguage(languageCode),
                              validator: ValidationBuilder()
                                  .minLength(
                                      6,
                                      passwordIsValid
                                          .getStringLanguage(languageCode))
                                  .required(fieldFilled
                                      .getStringLanguage(languageCode))),
                          SizedBoxLogin(height: 10),
                          TextFormLogin(
                              controller: _controllerPasswordConfirm,
                              textInputType: TextInputType.text,
                              obscureText: true,
                              labelText: loginSenhaConfirm
                                  .getStringLanguage(languageCode),
                              validator: ValidationBuilder().add((value) {
                                if (value.isEmpty)
                                  return passwordConfirmError
                                      .getStringLanguage(languageCode);
                                else if (value != _controllerPassword.text)
                                  return passwordConfirmError
                                      .getStringLanguage(languageCode);
                                return null;
                              }).required(
                                  fieldFilled.getStringLanguage(languageCode))),
                          SizedBoxLogin(height: 40),
                          ButtonSignin(
                            controllerEmail: _controllerEmail,
                            controllerPassword: _controllerPassword,
                            formKey: _formKey,
                            resetPassword: false,
                            createAccount: true,
                            buttonText: loginCreateAccount
                                .getStringLanguage(languageCode),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          } else {
            return Container(
              color: Colors.white,
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.green,
                  ),
                ),
              ),
            );
          }
        });
  }
}
