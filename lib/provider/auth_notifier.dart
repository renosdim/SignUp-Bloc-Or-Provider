import 'package:flutter/cupertino.dart';
import 'package:state_management_project_flutter/auth_requirements/auth_variables_and_funcitons.dart';
import 'package:provider/provider.dart';
import '../auth_forms/sign_up_form_example.dart';

class SignUpNotifier extends ChangeNotifier implements SignUpVariablesAndFunctions{
  @override
  String? email;

  @override
  String? password;

  @override
  bool? passwordVerified;

  @override
  SignUpStep? signUpStep;

  @override
  void nextStep() {

  }

  @override
  void onEmailChanged(String passedEmail) {
    final regex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (regex.hasMatch(passedEmail)) {
      email = passedEmail;
    }
  }

  @override
  void onPasswordChanged(String passedPassword) {
    final regex = RegExp(r'^(?=.*[A-Z])(?=.*\d)(?=.*[!@#\$%^&*(),.?":{}|<>]).*$');
    if (regex.hasMatch(passedPassword)) {
      password = passedPassword;
    }
  }

  @override
  void onPasswordsMatch(String secondPassword) {
    if (secondPassword == password) {
      passwordVerified = true;
    }
  }

  @override
  void onSignUp() {
    // TODO: implement onSignUp
  }

}

class SignUpMediator extends StatelessWidget {
  const SignUpMediator({super.key});

  @override
  Widget build(BuildContext context) {
    final signUpNotifier = context.read<SignUpNotifier>();
    return SignUpForm().copyWith();
  }
}
