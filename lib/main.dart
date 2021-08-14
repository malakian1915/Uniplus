import 'package:Uniplus/controllers/authentication/authentication_controller.dart';
import 'package:Uniplus/controllers/language/language_controller.dart';
import 'package:Uniplus/controllers/payment/payment_controller.dart';
import 'package:Uniplus/theme/theme.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/views/home/home_view.dart';
import 'package:Uniplus/views/login/login_view.dart';
import 'package:Uniplus/widgets/errorWidget/error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i18n_extension/i18n_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(Uniplus());
}

class Uniplus extends StatelessWidget {
  String languageCode;
  Future<String> _loadLanguage() async {
    var language = await LanguageController().getInstance().lerArquivo();
    languageCode = language.replaceAll("-", "_");
    return language ?? null;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      title: 'Uniplus',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      supportedLocales: [const Locale('en', "US"), const Locale('pt', "BR")],
      home: SafeArea(
        child: I18n(
          child: FutureBuilder(
            future: _initializeApp(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                if (snapshot.error.runtimeType == FlutterError) {
                  return Error(flutterError.getStringLanguage(languageCode),
                      Image.asset("assets/images/Error/error.png"));
                }
                return Error(
                    firebaseInitializingError.getStringLanguage(languageCode),
                    Image.asset("assets/images/Firebase/firebase_logo.png"));
              } else if (snapshot.connectionState == ConnectionState.done) {
                var user =
                    AuthenticationController().getInstance().getCurrentUser();
                if (user != null) {
                  return HomeView(user: user);
                }
                return LoginView();
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
          ),
        ),
      ),
    );
  }

  Future<void> _initializeApp() async {
    await AuthenticationController().getInstance().initializeFirebase();
    await LanguageController().getInstance().initializeLanguage();
    await PaymentController.getInstance().initializePayment();
    await _loadLanguage();
  }
}
