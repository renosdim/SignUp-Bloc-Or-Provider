import 'package:state_management_project_flutter/users/user_entity.dart';

class AuthState {}

class AuthInitial extends AuthState {}

class Authenticated extends AuthState {
  final User user;
  Authenticated(this.user);
}

class Unauthenticated extends AuthState {}

class AuthLoading extends AuthState {}

class AuthError extends AuthState {
  final String message;
  AuthError(this.message);
}

class AuthLogout extends AuthState {}

class AuthLogin extends AuthState {}

class AuthEmailValid extends AuthState {}

class AuthPasswordsMatch extends AuthState {}

class AuthPasswordsDoNotMatch extends AuthState {}

class AuthPasswordValid extends AuthState {}

class AuthEmailInvalid extends AuthState {}

class AuthPasswordInvalid extends AuthState {}

class AuthLoginSuccess extends AuthState {}

class AuthSignUpSuccess extends AuthState {}

class AuthSignUpFailure extends AuthState {}

class AuthSignUpInProgress extends AuthState {}

class AuthSignUpInitial extends AuthState {}

class AuthSignUpNextStep extends AuthState {}
