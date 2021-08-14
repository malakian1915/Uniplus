import 'package:Uniplus/controllers/authentication/authentication_controller.dart';
import 'package:Uniplus/controllers/movies/movie_controller.dart';
import 'package:Uniplus/controllers/payment/payment_controller.dart';
import 'package:Uniplus/controllers/series/serie_controller.dart';
import 'package:Uniplus/core/routes.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppBarUniplus extends StatelessWidget implements PreferredSizeWidget {
  User _user;
  String _languageCode;
  Color _cor;
  Color _titleColor;
  bool _showLeadingArrow;
  bool _showSearchIcon;
  bool _showMenu;
  String _title;

  AppBarUniplus(User user, String languageCode,
      {Color cor,
      Color titleColor,
      bool showLeadingArrow,
      bool showSearchIcon,
      bool showMenu,
      String title}) {
    _user = user;
    _languageCode = languageCode;
    _cor = cor;
    _titleColor = titleColor;
    _showLeadingArrow = showLeadingArrow == null ? false : showLeadingArrow;
    _showSearchIcon = showSearchIcon == null ? true : showSearchIcon;
    _showMenu = showMenu == null ? true : showMenu;
    _title = title != null
        ? title
        : _user.displayName == null
            ? hello.getStringLanguage(_languageCode)
            : _user.displayName.isEmpty
                ? hello.getStringLanguage(_languageCode)
                : hello.getStringLanguage(_languageCode) +
                    ", " +
                    _user.displayName.split(" ")[0].toUpperCase();
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: _cor == null ? Colors.transparent : _cor,
      elevation: 1,
      leading: _showLeadingArrow
          ? IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: _titleColor == null ? Colors.green : _titleColor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            )
          : IconButton(
              icon: Image.asset(
                "assets/images/Logo/new_logo.png",
              ),
              onPressed: () {},
            ),
      centerTitle: true,
      title: Text(
        _title,
        style: TextStyle(
          color: _titleColor == null ? Colors.green : _titleColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        _showSearchIcon
            ? IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.green,
                ),
                onPressed: () {
                  Navigator.of(context).push(Routes()
                      .getInstance()
                      .routeToSearchScreen(_user, _languageCode));
                },
              )
            : Container(),
        _showMenu
            ? PopupMenuButton<int>(
                color: Colors.transparent,
                elevation: 1,
                icon: Icon(
                  Icons.menu,
                  color: Colors.green,
                ),
                onSelected: (value) {
                  if (value == 1) {
                    Navigator.of(context).push(Routes()
                        .getInstance()
                        .routeToChangeLanguageScreen(_user));
                  } else if (value == 2) {
                    if (PaymentController.getInstance()
                                .paymentJsonModel
                                .planDTO ==
                            null ||
                        PaymentController.getInstance()
                                .paymentJsonModel
                                .paymentModel ==
                            null) {
                      Navigator.of(context).push(Routes()
                          .getInstance()
                          .routeToPlans(_user, _languageCode, null));
                    } else {
                      Navigator.of(context).push(Routes()
                          .getInstance()
                          .routeToPlanDetails(_user, _languageCode));
                    }
                  } else if (value == 3) {
                    showDialog(
                      context: context,
                      barrierDismissible: true,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.lightGreen,
                          title: Text(
                              signOutTitle.getStringLanguage(_languageCode)),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Text(signOutMessage
                                    .getStringLanguage(_languageCode)),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            TextButton(
                              child: Text(
                                signOutNo.getStringLanguage(_languageCode),
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
                                signOutYes.getStringLanguage(_languageCode),
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                              onPressed: () {
                                MovieController.getInstance().cleanMovies();
                                SerieController.getInstance().cleanSeries();

                                AuthenticationController()
                                    .getInstance()
                                    .signOut(context: context);

                                Navigator.of(context).pop();
                                Navigator.of(context).pushReplacement(Routes()
                                    .getInstance()
                                    .routeToLoginScreen());
                              },
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Text(
                      changeLanguage
                          .getStringLanguage(_languageCode)
                          .toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Text(
                      planLabel.getStringLanguage(_languageCode).toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Text(
                      signOutLabel
                          .getStringLanguage(_languageCode)
                          .toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
