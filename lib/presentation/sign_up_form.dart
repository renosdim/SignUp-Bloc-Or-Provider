import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_management_project_flutter/auth_requirements/auth_variables_and_funcitons.dart';
import 'package:state_management_project_flutter/bloc/auth_state.dart';

abstract class SignUpFormFormat extends StatelessWidget {
  final Function(String)? onEmailChanged;
  final Function(String)? onPasswordChanged;
  final Function(String)? onPasswordConfirmChanged;
  final AuthState? state;

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
      this.step,
      this.selectedEmail,
      this.selectedName,
      this.selectedPic,
      this.onPasswordConfirmChanged,
      this.onEmailChanged,
      this.onPasswordChanged,
      this.nextPage,
      this.previousPage,
      this.state});

  @override
  Widget build(BuildContext context);

  SignUpFormFormat copyWith(
      {AuthState? state,
      Function(String)? onEmailChanged,
      Function(String)? onPasswordChanged,
      Function(String)? onPasswordConfirmChanged,
      String? selectedEmail,
      String? selectedName,
      XFile? selectedPic,
      SignUpStep? step,
      VoidCallback? onSubmit,
      VoidCallback? nextPage,
      VoidCallback? previousPage});
}
