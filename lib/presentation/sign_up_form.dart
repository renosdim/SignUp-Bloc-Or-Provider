import 'package:flutter/material.dart';

abstract class SignUpFormFormat extends StatelessWidget {
  final Function(String)? onEmailChanged;
  final Function(String)? onPasswordChanged;
  final bool? signUpLoading;
  final bool? emailValid;
  final bool? passwordValid;
  final bool? passwordsMatch;
  final String? errorMessage;
  final bool? signUpSuccessful;
  

  final VoidCallback? onSubmit;

  const SignUpFormFormat({
    super.key,
    this.onEmailChanged,
    this.onPasswordChanged,
    this.onSubmit,
    this.formInProgress,
    this.emailValid,
    this.passwordValid,
  });

  @override
  Widget build(BuildContext context);

  SignUpFormFormat copyWith({
    Function(String)? onEmailChanged,
    Function(String)? onPasswordChanged,
    bool? formInProgress,
    bool? emailValid,
    bool? passwordValid,
    VoidCallback? onSubmit,
  });
}
