abstract class SignInVariablesAndFuncitons {
  String? email;
  String? password;
  
  void onEmailChanged(String email);
  void onPasswordChanged(String password);
  
  void onSignIn();
  
  
}
abstract class SignUpVariablesAndFunctions {
  String? email;
  String? password;
  bool? passwordVerified;
  void onEmailChanged(String email);
  void onPasswordChanged(String password);
  void onPasswordsMatch(String secondPassword);
  
  void onSignUp();
}