import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_project_flutter/auth_requirements/auth_variables_and_funcitons.dart';
import 'package:state_management_project_flutter/bloc/auth_state.dart';

class SignUpCubit extends Cubit<AuthState>
    implements SignUpVariablesAndFunctions {
  SignUpCubit(super.initialState);

  @override
  String? email;

  @override
  String? password;

  @override
  bool? passwordVerified;

  String? _secondPassword;

  @override
  void onEmailChanged(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (emailRegex.hasMatch(email)) {
      this.email = email;
      emit(AuthEmailValid());
    } else {
      this.email = null;
      emit(AuthEmailInvalid());
    }
  }

  @override
  void onPasswordChanged(String password) {
    if (password.length < 6) {
      this.password = null;
      passwordVerified = false;
      emit(AuthPasswordInvalid());
    } else {
      this.password = password;
      passwordVerified = false;
      emit(AuthPasswordValid());
    }
  }

  @override
  void onPasswordsMatch(String secondPassword) {
    _secondPassword = secondPassword;
    if (password == _secondPassword) {
      passwordVerified = true;
      emit(AuthPasswordsMatch());
    } else {
      passwordVerified = false;
      emit(AuthPasswordsDoNotMatch());
    }
  }

  @override
  void onSignUp() async {
    if (email == null || password == null || passwordVerified != true) {
      emit(AuthError(
          'Email and passwords must not be empty and passwords must match'));
    } else {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(AuthSignUpSuccess());
    }
  }

  @override
  void nextStep() {
    if (signUpStep == SignUpStep.email && email != null) {
      signUpStep = SignUpStep.password;
      emit(AuthSignUpNextStep());
    } else if (signUpStep == SignUpStep.password && password != null) {
      signUpStep = SignUpStep.passwordConfirm;
      emit(AuthSignUpNextStep());
    } else if (signUpStep == SignUpStep.passwordConfirm &&
        passwordVerified == true) {
      signUpStep = SignUpStep.pic;
      emit(AuthSignUpNextStep());
    } else if (signUpStep == SignUpStep.pic) {
      signUpStep = SignUpStep.finish;
      emit(AuthSignUpNextStep());
    }
    // TODO: implement nextStep
  }

  @override
  SignUpStep? signUpStep = SignUpStep.email;
}
