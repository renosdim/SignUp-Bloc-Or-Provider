import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_project_flutter/bloc/sign_up_cubit.dart';
import 'package:state_management_project_flutter/presentation/signUpWrapper.dart';

class SignUpFormExample extends StatelessWidget {
  const SignUpFormExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SignUpWrapper(
      builder: (context, signUpPresentationFormat) {
        return Scaffold(
          
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // If the signUpLoading is true, show a loading indicator
                if (signUpPresentationFormat.signUpLoading == true)
                  Center(
                    child: CircularProgressIndicator(),
                  ),
                
                // Otherwise, show the form
                if (signUpPresentationFormat.signUpLoading!=true)
                  Column(
                    children: [
                      // Email Field
                      TextField(
                        onChanged: (email) {
                          context.read<SignUpCubit>().onEmailChanged(email);
                        },
                        decoration: InputDecoration(
                          labelText: 'Email',
                          errorText: signUpPresentationFormat.emailValid == false
                              ? 'Please enter a valid email.'
                              : null,
                        ),
                      ),
                      SizedBox(height: 16.0),

                      // Password Field
                      TextField(
                        onChanged: (password) {
                          context.read<SignUpCubit>().onPasswordChanged(password);
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          errorText: signUpPresentationFormat.passwordValid == false
                              ? 'Please enter a valid password.'
                              : null,
                        ),
                      ),
                      SizedBox(height: 16.0),

                      // Confirm Password Field
                      TextField(
                        onChanged: (confirmPassword) {
                          context.read<SignUpCubit>().onPasswordsMatch(confirmPassword);
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          errorText: signUpPresentationFormat.passwordsMatch == false
                              ? 'Passwords do not match.'
                              : null,
                        ),
                      ),
                      SizedBox(height: 16.0),

                      // Error Message
                      if (signUpPresentationFormat.errorMessage != null)
                        Text(
                          signUpPresentationFormat.errorMessage!,
                          style: TextStyle(color: Colors.red),
                        ),
                      SizedBox(height: 16.0),

                      // Sign Up Button
                      ElevatedButton(
                        onPressed: () {
                          if (signUpPresentationFormat.emailValid == true &&
                              signUpPresentationFormat.passwordValid == true &&
                              signUpPresentationFormat.passwordsMatch == true) {
                            context.read<SignUpCubit>().onSignUp();
                          }
                        },
                        child: Text('Sign Up'),
                      ),
                      SizedBox(height: 16.0),

                      // Success Message
                      if (signUpPresentationFormat.signUpSuccessful == true)
                        Text(
                          'Sign Up Successful!',
                          style: TextStyle(color: Colors.green),
                        ),
                    ],
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
