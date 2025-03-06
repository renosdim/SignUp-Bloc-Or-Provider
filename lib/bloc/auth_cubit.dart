import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_project_flutter/bloc/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  String? email;
  String? password;
  AuthCubit(super.initialState);

  void onEmailChanged(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (emailRegex.hasMatch(email)) {
      emit(AuthEmailInvalid());
    } else {
      emit(AuthEmailInvalid());
    }
  }

  void onPasswordChanged(String password) {
    if (password.length < 6) {
      emit(AuthPasswordInvalid());
    } else {
      emit(AuthPasswordValid());
    }
  }

  void login() async {
    if (email == null || password == null) {
      emit(AuthError('Email and password must not be empty'));
    } else {
      emit(AuthLoading());
      await Future.delayed(const Duration(seconds: 2));
      emit(AuthLoginSuccess());
    }
  }
}
