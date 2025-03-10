import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

abstract class SignInVariablesAndFuncitons {
  String? email;
  String? password;

  void onEmailChanged(String email);
  void onPasswordChanged(String password);

  void onSignIn();
}

abstract class SignUpVariablesAndFunctions {
  String? email;
  String? password;
  String? name;
  bool? passwordVerified;
  SignUpStep? signUpStep;
  XFile? pic;
  void onEmailChanged(String email);
  void onPicChanged(XFile pic);
  void onPasswordChanged(String password);
  void onPasswordsMatch(String secondPassword);
  void onNameChanged(String name);
  void nextStep();
  void previousStep();

  void onSignUp();
}

enum SignUpStep { email, name, password, passwordConfirm, pic, finish }
