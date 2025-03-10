import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_management_project_flutter/auth_requirements/auth_variables_and_funcitons.dart';


abstract class SignUpFormFormat extends StatelessWidget {
  final Function(String)? onEmailChanged;
  final Function(String)? onPasswordChanged;
  final Function(String)? onPasswordConfirmChanged;
  final Function(String)? onNameChanged;
  final Function(XFile)? onPicChanged;
  final String? selectedPassword;
  final bool? confirmedPassword;
  final String? selectedEmail;
  final String? selectedName;
  final XFile? selectedPic;
  final SignUpStep? step;
  final VoidCallback? onSubmit;
  final VoidCallback? nextPage;
  final VoidCallback? previousPage;
  final TextEditingController? controller;

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
        this.onPicChanged,
      this.nextPage,
      this.previousPage,
        this.onNameChanged, this.selectedPassword, this.confirmedPassword, this.controller
      });

  @override
  Widget build(BuildContext context);

  SignUpFormFormat copyWith(
      {
      Function(String)? onEmailChanged,
      Function(String)? onPasswordChanged,
      Function(String)? onPasswordConfirmChanged,
        Function(XFile)? onPicChanged,
        Function(String)? onNameChanged,
      String? selectedEmail,
      String? selectedName,
        String? selectedPassword,
        bool? confirmedPassword,
      XFile? selectedPic,
      SignUpStep? step,
      VoidCallback? onSubmit,
      VoidCallback? nextPage,
        TextEditingController? controller,
      VoidCallback? previousPage});
}
