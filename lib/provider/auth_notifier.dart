import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_management_project_flutter/auth_requirements/auth_variables_and_funcitons.dart';


class SignUpNotifier extends ChangeNotifier implements SignUpVariablesAndFunctions{
  @override
  String? email;

  TextEditingController controller = TextEditingController();


  @override
  XFile? pic;

  @override
  String? name;

  @override
  String? password;

  @override
  bool? passwordVerified;

  @override
  SignUpStep? signUpStep = SignUpStep.email;

  @override
  void nextStep() {
    if (signUpStep == SignUpStep.email) {
      signUpStep = SignUpStep.name;
      controller.clear();
    } else if (signUpStep == SignUpStep.name) {
      signUpStep = SignUpStep.password;
      controller.clear();
    } else if (signUpStep == SignUpStep.password) {
      signUpStep = SignUpStep.passwordConfirm;
      controller.clear();
    } else if (signUpStep == SignUpStep.passwordConfirm) {
      signUpStep = SignUpStep.pic;
      controller.clear();
    } else if (signUpStep == SignUpStep.pic) {
      signUpStep = SignUpStep.finish;
    }
    notifyListeners();
  }

  @override
  void onEmailChanged(String passedEmail) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (regex.hasMatch(passedEmail)) {
      email = passedEmail;
    } else {
      email = null;
    }
    notifyListeners();
  }

  @override
  void onPasswordChanged(String passedPassword) {
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>]).*$');
    if (regex.hasMatch(passedPassword)) {
      password = passedPassword;
    } else {
      password = null;
    }
    notifyListeners();
  }

  @override
  void onPasswordsMatch(String secondPassword) {
    if (secondPassword == password) {
      passwordVerified = true;
      notifyListeners();
    }
  }

  @override
  void onSignUp() {
    // TODO: implement onSignUp
  }

  @override
  void onNameChanged(String passedName) {
    if (passedName.isNotEmpty) {
      name = passedName;
    } else {
      name = null;
    }
    notifyListeners();
  }

  @override
  void previousStep() {
    if (signUpStep == SignUpStep.name) {
      signUpStep = SignUpStep.email;
      controller.text = email!;
    } else if (signUpStep == SignUpStep.password) {
      signUpStep = SignUpStep.name;
      controller.text = name!;
    } else if (signUpStep == SignUpStep.passwordConfirm) {
      signUpStep = SignUpStep.password;
      controller.text = password!;
    } else if (signUpStep == SignUpStep.pic) {
      signUpStep = SignUpStep.passwordConfirm;
      controller.text = password!;
    }
    notifyListeners();
  }

  @override
  void onPicChanged(XFile passedPic) {
    pic = passedPic;
    notifyListeners();
  }

}

