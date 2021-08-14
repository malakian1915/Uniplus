import 'package:Uniplus/controllers/language/language_controller.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/widgets/loginWidgets/button_login_google.dart';
import 'package:Uniplus/widgets/loginWidgets/button_signin.dart';
import 'package:Uniplus/widgets/loginWidgets/links_forgot_signup.dart';
import 'package:Uniplus/widgets/loginWidgets/sized_box.dart';
import 'package:Uniplus/widgets/loginWidgets/text_form_login.dart';
import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _controllerEmail = new TextEditingController();
  final _controllerPassword = new TextEditingController();

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
                            widget:
                                Image.asset("assets/images/Logo/new_logo.png")),
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
                        SizedBoxLogin(height: 15),
                        LinksForgotSignup(
                            Alignment.centerRight,
                            recuperarSenha.getStringLanguage(languageCode),
                            TextStyle(color: Colors.black, fontSize: 15),
                            true),
                        SizedBoxLogin(height: 40),
                        ButtonSignin(
                          controllerEmail: _controllerEmail,
                          controllerPassword: _controllerPassword,
                          formKey: _formKey,
                          resetPassword: false,
                          createAccount: false,
                          buttonText:
                              loginEntrar.getStringLanguage(languageCode),
                        ),
                        SizedBoxLogin(height: 10),
                        LinksForgotSignup(
                            Alignment.center,
                            loginCadastrar.getStringLanguage(languageCode),
                            TextStyle(color: Colors.blueGrey, fontSize: 15),
                            false),
                        SizedBoxLogin(height: 30),
                        Divider(
                          height: 5,
                          thickness: 1.5,
                        ),
                        SizedBoxLogin(height: 40),
                        ButtonLoginGoogle(
                            loginEntrarGoogle.getStringLanguage(languageCode)),
                        SizedBoxLogin(height: 10),
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
      },
    );
  }
}
