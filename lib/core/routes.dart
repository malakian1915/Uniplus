import 'package:Uniplus/models/movies/movie_model.dart';
import 'package:Uniplus/models/plan/planDTO.dart';
import 'package:Uniplus/models/series/serie_model.dart';
import 'package:Uniplus/views/changeLanguage/change_language.dart';
import 'package:Uniplus/views/details/movie_details/movie_details.dart';
import 'package:Uniplus/views/details/serie_details/serie_details.dart';
import 'package:Uniplus/views/home/home_view.dart';
import 'package:Uniplus/views/login/createAccount/create_account.dart';
import 'package:Uniplus/views/login/login_view.dart';
import 'package:Uniplus/views/login/resetPassword/reset_password.dart';
import 'package:Uniplus/views/payment/alter_payment/alter_payment.dart';
import 'package:Uniplus/views/payment/payment.dart';
import 'package:Uniplus/views/plans/planDetails/plan_details.dart';
import 'package:Uniplus/views/plans/plans.dart';
import 'package:Uniplus/views/search/search_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes _instance;
  var begin = Offset(-1.0, -1.0);
  var end = Offset.zero;
  var curve = Curves.ease;

  Routes getInstance() {
    if (_instance == null) {
      _instance = new Routes();
    }
    return _instance;
  }

  Route routeToHomeView(User user) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          HomeView(user: user),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route routeToCreateAccount() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => CreateAccount(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route routeToResetPassword() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => ResetPassword(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route routeToLoginScreen() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route routeToChangeLanguageScreen(User user) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          ChangeLanguage(user: user),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route routeToSearchScreen(user, languageCode) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          SearchView(user, languageCode),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route routeToMovieDetails(MovieModel movie, User user, String languageCode,
      {int movieId}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          MovieDetails(movie, user, languageCode, movieId: movieId),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route routeToSerieDetails(SerieModel serie, User user, String languageCode,
      {int serieId}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          SerieDetails(serie, user, languageCode, serieId: serieId),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route routeToPlans(User user, String languageCode, String currentPlan) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          Plans(user, languageCode, currentPlan),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route routeToPayment(User user, String languageCode, PlanDTO selectedPlan) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          Payment(user, languageCode, selectedPlan),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route routeToPlanDetails(User user, String languageCode) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          PlanDetails(user, languageCode),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  Route routeToAlterPayment(User user, String languageCode) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          AlterPayment(user, languageCode),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
