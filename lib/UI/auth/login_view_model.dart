import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/models/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../../app/app.router.dart';
import '../../core/helpers/sharepreferance.dart';
import '../../core/service_locator/service_locator.dart';
import '../../core/services/needed_utils.dart';
import 'package:crypto/crypto.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NeededVariables _neededVariables = locator<NeededVariables>();
  NeededVariables get neededVariables => _neededVariables;

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool checkbox = false;

  String errorEmailText = "";
  String errorPasswordText = "";
  String? errorMessage;

  changeStatus() {
    checkbox = !checkbox;
    notifyListeners();
  }

  init() {}

  validationFunction(BuildContext context) async {
    if (email.text == "" && password.text == "") {
      Fluttertoast.showToast(msg: "Please Enter Email and Passwosd...");
      errorEmailText = "Please Enter Email";
      errorPasswordText = "Please Enter Password";
    } else {
      errorEmailText = "";
      errorPasswordText = "";
      if (!email.text.contains("@")) {
        errorEmailText = "Enter Valid Email";
        Fluttertoast.showToast(msg: "Please Enter Valid Email ID...");
      } else if (password.text == "") {
        errorPasswordText = "Enter Password";
        Fluttertoast.showToast(msg: "Please Enter Password...");
      } else {
        errorEmailText = "";
        errorPasswordText = "";
        await login(context);
      }
    }
    notifyListeners();
  }

  Future login(BuildContext context) async {
    setBusy(true);
    try {
      final user = await _auth.signInWithEmailAndPassword(email: email.text, password: password.text);

      if (user != null) {
        await SharedPrefs.storeValue(value: user.user!.uid, keyValue: "user");
        setBusy(false);
        _navigationService.navigateTo(Routes.homeScreen);
      }
    } on FirebaseAuthException catch (error) {
      setBusy(false);
      switch (error.code) {
        case "ERROR_INVALID_EMAIL":
          errorMessage = "Your email address appears to be malformed.";
          break;
        case "ERROR_WRONG_PASSWORD":
          errorMessage = "Your password is wrong.";
          break;
        case "ERROR_USER_NOT_FOUND":
          errorMessage = "User with this email doesn't exist.";
          break;
        case "ERROR_USER_DISABLED":
          errorMessage = "User with this email has been disabled.";
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          errorMessage = "Too many requests. Try again later.";
          break;
        case "ERROR_OPERATION_NOT_ALLOWED":
          errorMessage = "Signing in with Email and Password is not enabled.";
          break;
        default:
          errorMessage = "An undefined Error happened.";
      }
      notifyListeners();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage ?? "Error")));
    }
  }
}
