import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task2/screens/login_screen.dart';
import 'package:task2/screens/users_chat.dart';

class AurhServices {
  String? errorMessage;

  final FirebaseAuth _loginAndRegister = FirebaseAuth.instance;

  Future signIn(BuildContext context, String email, String password) async {
    try {
      await _loginAndRegister
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: 'Login Successful'),
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UsersChat(),
                  ),
                  (Route<dynamic> route) => false,
                ),
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          errorMessage = 'Your email address appears to be malformed.';
          break;
        case 'wrong-password':
          errorMessage = 'Your password is wrong.';
          break;
        case 'user-not-found':
          errorMessage = "User with this email doesn't exist.";
          break;
        case 'user-disabled':
          errorMessage = 'User with this email has been disabled.';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many requests';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Signing in with Email and Password is not enabled.';
          break;
        default:
          errorMessage = 'An undefined Error happened.';
      }
      Fluttertoast.showToast(msg: errorMessage!);
    }
  }

  Future signUp(BuildContext context, String email, String password) async {
    try {
      await _loginAndRegister
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                Fluttertoast.showToast(msg: 'Register Successful'),
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const UsersChat(),
                  ),
                  (Route<dynamic> route) => false,
                ),
              });
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'invalid-email':
          errorMessage = 'Your email address appears to be malformed.';
          break;
        case 'wrong-password':
          errorMessage = 'Your password is wrong.';
          break;
        case 'user-not-found':
          errorMessage = "User with this email doesn't exist.";
          break;
        case 'user-disabled':
          errorMessage = 'User with this email has been disabled.';
          break;
        case 'too-many-requests':
          errorMessage = 'Too many requests';
          break;
        case 'operation-not-allowed':
          errorMessage = 'Signing in with Email and Password is not enabled.';
          break;
        default:
          errorMessage = 'An undefined Error happened.';
      }
      Fluttertoast.showToast(msg: errorMessage!);
    }
  }
}

void logOut(BuildContext context) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (context) => const LoginScreen(),
    ),
    (Route<dynamic> route) => false,
  );
}
