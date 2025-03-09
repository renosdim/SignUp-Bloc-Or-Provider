 import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:state_management_project_flutter/bloc/auth_state.dart';
import 'package:state_management_project_flutter/bloc/sign_up_cubit.dart';
import 'package:state_management_project_flutter/presentation/sign_up_format.dart';
class SignUpWrapper extends StatelessWidget{
  final Widget Function(BuildContext context,SignUpWrapperPresentationFormat signUpPresentationFormat) builder;
  const SignUpWrapper({super.key,required this.builder});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return BlocProvider(
      create: (context)=>SignUpCubit(AuthSignUpInitial()),
      child: Signupwrapper(builder: builder)
    );
  }
  
}
class Signupwrapper extends StatelessWidget {
  final Widget Function(BuildContext context,SignUpWrapperPresentationFormat signUpPresentationFormat) builder;
  
  const Signupwrapper({super.key,required this.builder});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit,AuthState>(
      builder: (context, state) {
        bool? signUpLoading ;
        bool? emailValid = context.read<SignUpCubit>().email!= null;
        bool? passwordValid = context.read<SignUpCubit>().password!= null;
        bool? passwordsMatch = context.read<SignUpCubit>().passwordVerified;
        String? errorMessage;
        bool? signUpSuccessful;
        if(state is AuthLoading){
          signUpLoading = true;
        }
        if(state is AuthSignUpInitial){
          signUpLoading = null;
          emailValid = null;
          passwordValid =null;
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

        final signUpPresentationFormat = SignUpWrapperPresentationFormat(
          emailValid: emailValid,
          passwordValid: passwordValid,
          passwordsMatch: passwordsMatch,
          errorMessage: errorMessage,
          signUpSuccessful: signUpSuccessful,
          signUpLoading: signUpLoading
        );
        return builder(context,signUpPresentationFormat);
      }
    
    , listener: (context,state)=>{});
  }
}