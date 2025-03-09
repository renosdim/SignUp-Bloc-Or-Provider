


class SignUpWrapperPresentationFormat{
final bool? emailValid;
final bool? passwordValid;
final bool? passwordsMatch;
final String? errorMessage;
final bool? signUpLoading;
  final bool? signUpSuccessful;

  const SignUpWrapperPresentationFormat({
	this.signUpLoading,
	this.emailValid,
	this.passwordValid,
	this.passwordsMatch,
	this.errorMessage,
	this.signUpSuccessful,
  });
  
}