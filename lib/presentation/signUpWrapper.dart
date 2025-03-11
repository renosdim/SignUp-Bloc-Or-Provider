import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_project_flutter/auth_requirements/auth_variables_and_funcitons.dart';

import 'package:state_management_project_flutter/bloc/sign_up_cubit.dart';
import 'package:state_management_project_flutter/presentation/auth_state.dart';
import 'package:state_management_project_flutter/presentation/sign_up_form.dart';

class SignUpWrapper extends StatelessWidget {
  final SignUpFormFormat widget;
  const SignUpWrapper({super.key, required this.widget});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
        create: (context) => SignUpCubit(AuthSignUpInitial()),
        child: _Signupwrapper(
          widget: widget,
        ));
  }
}

class _Signupwrapper extends StatelessWidget {
  final SignUpFormFormat widget;

  const _Signupwrapper({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, AuthState>(
        builder: (context, state) {
          bool? signUpLoading;
          bool? emailValid = context.read<SignUpCubit>().email != null;
          bool? passwordValid = context.read<SignUpCubit>().password != null;
          bool? passwordsMatch = context.read<SignUpCubit>().passwordVerified;
          String? errorMessage;
          bool? signUpSuccessful;
          SignUpStep? authSignUpNextStep =
              context.read<SignUpCubit>().signUpStep;
          if (state is AuthLoading) {
            signUpLoading = true;
          }
          if (state is AuthSignUpInitial) {
            signUpLoading = null;
            emailValid = null;
            passwordValid = null;
            passwordsMatch = null;
            errorMessage = null;
            signUpSuccessful = null;
          }
          if (state is AuthSignUpSuccess) {
            signUpSuccessful = true;
          }
          if (state is AuthEmailValid) {
            emailValid = true;
          }
          if (state is AuthPasswordValid) {
            passwordValid = true;
          }
          if (state is AuthPasswordsMatch) {
            passwordsMatch = true;
          }
          if (state is AuthError) {
            errorMessage = state.message;
            signUpSuccessful = false;
          }

          return widget.copyWith(
              onEmailChanged: context.read<SignUpCubit>().onEmailChanged,
              onPasswordChanged: context.read<SignUpCubit>().onPasswordChanged,
              formInProgress: signUpLoading,
              selectedEmail: context.read<SignUpCubit>().email,
              onPasswordConfirmChanged:
                  context.read<SignUpCubit>().onPasswordsMatch,
              emailValid: emailValid,
              passwordValid: passwordValid,
              passwordsMatch: passwordsMatch,
              selectedName: null,
              selectedPic: null,
              step: authSignUpNextStep,
              onSubmit: context.read<SignUpCubit>().onSignUp,
              nextPage: context.read<SignUpCubit>().nextStep);
        },
        listener: (context, state) => {});
  }
}
