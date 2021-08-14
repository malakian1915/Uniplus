import 'package:Uniplus/controllers/language/language_controller.dart';
import 'package:Uniplus/controllers/movies/movie_controller.dart';
import 'package:Uniplus/controllers/series/serie_controller.dart';
import 'package:Uniplus/core/routes.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/widgets/shared/appBar/app_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

enum LanguageOptions { portuguese, english }

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key key, User user})
      : _user = user,
        super(key: key);

  final User _user;

  @override
  _ChangeLanguageState createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  User _user;
  LanguageOptions _languageOption;

  String languageCode;
  Future<String> _loadLanguage() async {
    var language = await LanguageController().getInstance().lerArquivo();
    languageCode = language.replaceAll("-", "_");

    if (languageCode == "en_us")
      _languageOption = LanguageOptions.english;
    else if (languageCode == "pt_br")
      _languageOption = LanguageOptions.portuguese;

    return language ?? null;
  }

  @override
  void initState() {
    _user = widget._user;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _loadLanguage(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Scaffold(
                appBar: AppBarUniplus(
                  _user,
                  languageCode,
                  cor: Colors.green,
                  titleColor: Colors.white,
                  title: titleChangeLanguage.getStringLanguage(languageCode),
                  showLeadingArrow: true,
                  showMenu: false,
                  showSearchIcon: false,
                ),
                backgroundColor: Colors.white,
                body: Center(
                  child: Card(
                    color: Colors.white,
                    elevation: 15,
                    child: SizedBox(
                      width: 300,
                      height: 250,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                    activeColor: Colors.green,
                                    value: LanguageOptions.english,
                                    groupValue: _languageOption,
                                    onChanged: (LanguageOptions value) {
                                      setState(() {
                                        _changeLanguage(value);
                                      });
                                    }),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _changeLanguage(LanguageOptions.english);
                                    });
                                  },
                                  child: SizedBox(
                                    width: 120,
                                    child: Image.asset(
                                        "assets/images/Flags/usa_flag.png"),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 40),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio(
                                    activeColor: Colors.green,
                                    value: LanguageOptions.portuguese,
                                    groupValue: _languageOption,
                                    onChanged: (LanguageOptions value) {
                                      setState(() {
                                        _changeLanguage(value);
                                      });
                                    }),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _changeLanguage(
                                          LanguageOptions.portuguese);
                                    });
                                  },
                                  child: SizedBox(
                                    width: 120,
                                    child: Image.asset(
                                        "assets/images/Flags/brazil_flag.png"),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
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

  void _changeLanguage(LanguageOptions value) {
    if (value != _languageOption) {
      if (value == LanguageOptions.english) {
        LanguageController().getInstance().salvarLanguage("en-us");
      } else if (value == LanguageOptions.portuguese) {
        LanguageController().getInstance().salvarLanguage("pt-br");
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
          content: Text(
            languageChanged.getStringLanguage(languageCode),
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.5),
          ),
        ),
      );

      MovieController.getInstance().cleanMovies();
      SerieController.getInstance().cleanSeries();
      Navigator.pushAndRemoveUntil(
          context,
          Routes().getInstance().routeToHomeView(_user),
          (Route<dynamic> route) => false);

      _languageOption = value;
    }
  }
}
