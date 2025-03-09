import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_management_project_flutter/auth_requirements/auth_variables_and_funcitons.dart';

abstract class SignUpFormFormat extends StatelessWidget {
  final Function(String)? onEmailChanged;
  final Function(String)? onPasswordChanged;
  final Function(String)? onPasswordConfirmChanged;
  final bool? emailValid;
  final bool? passwordValid;
  final bool? passwordsMatch;
  final bool? formInProgress;
  final String? selectedEmail;
  final String? selectedName;
  final XFile? selectedPic;
  final SignUpStep? step;
  final VoidCallback? onSubmit;
  final VoidCallback? nextPage;
  final VoidCallback? previousPage;

  const SignUpFormFormat(
      {super.key,
      this.onSubmit,
      this.formInProgress,
      this.step,
      this.selectedEmail,
      this.selectedName,
      this.selectedPic,
      this.onPasswordConfirmChanged,
      this.emailValid,
      this.passwordValid,
      this.passwordsMatch,
      this.onEmailChanged,
      this.onPasswordChanged,
      this.nextPage,
      this.previousPage});

  @override
  Widget build(BuildContext context);

  SignUpFormFormat copyWith(
      {Function(String)? onEmailChanged,
      Function(String)? onPasswordChanged,
      Function(String)? onPasswordConfirmChanged,
      bool? emailValid,
      bool? passwordValid,
      bool? passwordsMatch,
      bool? formInProgress,
      String? selectedEmail,
      String? selectedName,
      XFile? selectedPic,
      SignUpStep? step,
      VoidCallback? onSubmit,
      VoidCallback? nextPage,
      VoidCallback? previousPage});
}
