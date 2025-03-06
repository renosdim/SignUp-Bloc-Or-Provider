abstract class AuthVariablesAndFuncitons {
  String? email;
  String? password;
  bool? passwordVerified;
  void onEmailChanged(String email);
  void onPasswordChanged(String password);
  void onPasswordsMatch(String secondPassword);
  void onSignIn();
  void onSignUp();
  void onSignOut();
}
