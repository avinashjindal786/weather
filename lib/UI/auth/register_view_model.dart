import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_assignment/UI/auth/register_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../core/helpers/sharepreferance.dart';
import '../../core/service_locator/service_locator.dart';
import '../../core/services/needed_utils.dart';

class RegisterViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final NeededVariables _neededVariables = locator<NeededVariables>();
  NeededVariables get neededVariables => _neededVariables;

  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool checkbox = false;

  String errorEmailText = "";
  String errorPasswordText = "";
  String? errorMessage;
  changeStatus() {
    checkbox = !checkbox;
    notifyListeners();
  }

  final _auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

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
        final value = passwordVerify();
        if (value) {
          profilePath == null ? Fluttertoast.showToast(msg: "Please Add Your Profile Pic") : await register(context);
        } else {
          Fluttertoast.showToast(msg: "Please Enter Correct Password");
        }
      }
    }
    notifyListeners();
  }

  passwordVerify() {
    if (password.text == confirmPassword.text) {
      return true;
    } else {
      return false;
    }
  }

  XFile? profilePath;

  addProfilePath(XFile path) {
    profilePath = path;
    notifyListeners();
  }

  cameraDialogFunc(BuildContext context) async {
    await availableCameras().then((value) async => await showDialog(
            context: context,
            builder: (context) => Dialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
                backgroundColor: Colors.transparent,
                child: CameraPage(
                  cameras: value,
                ))).then((value) {
          if (value != null) {
            addProfilePath(value);
          }
        }));
  }

  Future register(BuildContext context) async {
    setBusy(true);
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(email: email.text, password: password.text);
      if (newUser != null) {
        Reference ref = _storage.ref().child('images/${DateTime.now()}.png');
        await ref.putFile(File(profilePath!.path));
        String downloadUrl = await ref.getDownloadURL();
        await firestore.collection('users').doc(newUser.user!.uid).set({
          "email": email.text,
          "password": password.text,
          "full_name": name.text,
          "userId": newUser.user!.uid,
          "profilePic": downloadUrl,
        });
        _navigationService.back();
        setBusy(false);
      }
    } on FirebaseAuthException catch (error) {
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
      setBusy(false);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage ?? "")));
    }
  }
}
