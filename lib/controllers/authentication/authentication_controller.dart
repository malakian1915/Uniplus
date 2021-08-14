import 'package:Uniplus/controllers/language/language_controller.dart';
import 'package:Uniplus/core/routes.dart';
import 'package:Uniplus/translations/translations.dart';
import 'package:Uniplus/views/login/login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationController {
  AuthenticationController _instance;

  AuthenticationController getInstance() {
    if (_instance == null) {
      _instance = new AuthenticationController();
    }
    return _instance;
  }

  Future<String> _loadLanguage() async {
    var language = await LanguageController().getInstance().lerArquivo();
    return language.replaceAll("-", "_") ?? null;
  }

  Future<FirebaseApp> initializeFirebase() async {
    return await Firebase.initializeApp();
  }

  User getCurrentUser() {
    return FirebaseAuth?.instance?.currentUser ?? null;
  }

  Future<User> signInWithEmailAndPassword(String email, String password,
      {BuildContext context}) async {
    User user;

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      user = userCredential.user;

      if (!user.emailVerified) {
        var languageCode = await _loadLanguage();
        ScaffoldMessenger.of(context).showSnackBar(
          AuthenticationController._customSnackBar(
            verifyEmail.getStringLanguage(languageCode),
          ),
        );

        signOut(context: context);

        return null;
      }
    } on FirebaseAuthException catch (e) {
      await _firebaseExceptions(e, context);
    } on Exception catch (error) {
      var languageCode = await _loadLanguage();
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          loginError.getStringLanguage(languageCode),
        ),
      );
    }

    return user;
  }

  Future<User> signInWithGoogle({BuildContext context}) async {
    User user;

    try {
      FirebaseAuth auth = FirebaseAuth.instance;

      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();

      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential userCredential =
            await auth.signInWithCredential(credential);

        user = userCredential.user;

        if (!user.emailVerified) {
          var languageCode = await _loadLanguage();
          ScaffoldMessenger.of(context).showSnackBar(
            AuthenticationController._customSnackBar(
              verifyEmail.getStringLanguage(languageCode),
            ),
          );

          signOut(context: context);

          return null;
        }
      }

      if (user == null) {
        var languageCode = await _loadLanguage();
        ScaffoldMessenger.of(context).showSnackBar(
          AuthenticationController._customSnackBar(
            loginCanceled.getStringLanguage(languageCode),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      await _firebaseExceptions(e, context);
    } on Exception catch (error) {
      var languageCode = await _loadLanguage();
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          googleSignInError.getStringLanguage(languageCode),
        ),
      );
    }

    return user;
  }

  Future<void> signOut({BuildContext context}) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();

    try {
      if (await googleSignIn.isSignedIn()) {
        await googleSignIn.signOut();
      }
      await FirebaseAuth.instance.signOut();
    } on Exception catch (error) {
      var languageCode = await _loadLanguage();
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          signOutError.getStringLanguage(languageCode),
        ),
      );
    }
  }

  Future<void> resetPassword(String email, {BuildContext context}) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      await auth.sendPasswordResetEmail(email: email);

      var languageCode = await _loadLanguage();
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          emailSent.getStringLanguage(languageCode),
        ),
      );

      Navigator.of(context)
          .pushReplacement(Routes().getInstance().routeToLoginScreen());
    } on FirebaseAuthException catch (e) {
      await _firebaseExceptions(e, context);
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          e.toString(),
        ),
      );
    }
  }

  Future<void> createAccount(String email, String senha,
      {BuildContext context}) async {
    try {
      FirebaseAuth auth = FirebaseAuth.instance;
      var userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: senha);

      if (userCredential != null) userCredential.user.sendEmailVerification();

      var languageCode = await _loadLanguage();
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          accountCreated.getStringLanguage(languageCode),
        ),
      );

      signOut(context: context);

      Navigator.of(context)
          .pushReplacement(Routes().getInstance().routeToLoginScreen());
    } on FirebaseAuthException catch (e) {
      await _firebaseExceptions(e, context);
    } on Exception catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          e.toString(),
        ),
      );
    }
  }

  Future<void> _firebaseExceptions(
      FirebaseAuthException e, BuildContext context) async {
    var languageCode = await _loadLanguage();

    if (e.code == 'account-exists-with-different-credential') {
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          accountGoogleExistsWithDifferentCredentials
              .getStringLanguage(languageCode),
        ),
      );
    } else if (e.code == 'invalid-credential') {
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          accountGoogleWrongCredentials.getStringLanguage(languageCode),
        ),
      );
    } else if (e.code == 'user-not-found') {
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          userNotFound.getStringLanguage(languageCode),
        ),
      );
    } else if (e.code == 'wrong-password') {
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          wrongPassword.getStringLanguage(languageCode),
        ),
      );
    } else if (e.code == 'invalid-email') {
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          emailIsValid.getStringLanguage(languageCode),
        ),
      );
    } else if (e.code == 'user-disabled') {
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          userDisabled.getStringLanguage(languageCode),
        ),
      );
    } else if (e.code == 'email-already-in-use') {
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          accountAlreadyExists.getStringLanguage(languageCode),
        ),
      );
    } else if (e.code == 'too-many-requests') {
      ScaffoldMessenger.of(context).showSnackBar(
        AuthenticationController._customSnackBar(
          firebaseTooManyRequests.getStringLanguage(languageCode),
        ),
      );
    }
  }

  static SnackBar _customSnackBar(String content) {
    return SnackBar(
      backgroundColor: Colors.red,
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            letterSpacing: 0.5),
      ),
    );
  }
}
