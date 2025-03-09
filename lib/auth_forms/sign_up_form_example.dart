import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_management_project_flutter/auth_requirements/auth_variables_and_funcitons.dart';
import 'package:state_management_project_flutter/bloc/sign_up_cubit.dart';
import 'package:state_management_project_flutter/presentation/signUpWrapper.dart';
import 'package:state_management_project_flutter/presentation/sign_up_form.dart';

class SignUpForm extends SignUpFormFormat {
  const SignUpForm(
      {super.key,
      super.onEmailChanged,
      super.onPasswordChanged,
      super.emailValid,
      super.passwordsMatch,
      super.passwordValid,
      super.formInProgress,
      super.selectedEmail,
      super.selectedName,
      super.selectedPic,
      super.onSubmit,
      super.previousPage,
      super.step,
      super.onPasswordConfirmChanged,
      super.nextPage});

  String titleFind() {
    if (step == SignUpStep.email) {
      return "Pass your email:";
    } else if (step == SignUpStep.pic) {
      return "Select a profile pic";
    } else if (step == SignUpStep.name) {
      return "Enter your name";
    } else if (step == SignUpStep.password) {
      return "Enter your password";
    } else if (step == SignUpStep.passwordConfirm) {
      return "Confirm your password";
    } else {
      return "All Done!";
    }
  }

  Icon findIcon() {
    if (step == SignUpStep.email) {
      return Icon(CupertinoIcons.mail_solid, color: Colors.white, size: 15);
    } else if (step == SignUpStep.name) {
      return Icon(CupertinoIcons.person_alt, color: Colors.white, size: 15);
    } else if (step == SignUpStep.password) {
      return Icon(CupertinoIcons.padlock, color: Colors.white, size: 15);
    } else {
      return Icon(CupertinoIcons.padlock_solid, color: Colors.white, size: 15);
    }
  }

  String findPlaceholderText() {
    if (step == SignUpStep.email) {
      return "We will verify it later...";
    } else if (step == SignUpStep.name) {
      return "It will be displayed in your profile...";
    } else if (step == SignUpStep.password) {
      return "Must use at least a capital, a number and a special character...";
    } else {
      return "Must match your password exactly...";
    }
  }

  Widget picContainer(XFile? pic) {
    return Column(
      children: [
        SizedBox(height: 15),
        Container(
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 3, color: Colors.transparent),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.deepPurple, Colors.deepOrange],
                  stops: [0.3, 1])),
          width: 150,
          height: 150,
          child: CircleAvatar(
              backgroundColor: Colors.black,
              backgroundImage: pic != null ? FileImage(File(pic.path)) : null,
              child: Icon(CupertinoIcons.add, color: Colors.deepOrange)),
        ),
        SizedBox(height: 15)
      ],
    );
  }

  Widget mainTitle() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 17, 0, 30),
      child: Text("Your App Sign - Up",
          style: TextStyle(
              color: Colors.white,
              fontSize: 35,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontFamily: "San Francisco")),
    );
  }

  TextStyle titleTextStyle() {
    return TextStyle(
        fontFamily: "San Francisco",
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        color: Colors.white,
        fontSize: 14);
  }

  @override
  Widget build(BuildContext context) {
    late Function(String)? onChanged;
    String? errorText;
    bool? conditionForValidity;
    if (step == SignUpStep.email) {
      onChanged = onEmailChanged!;
      errorText = "This is not an email";
      conditionForValidity = emailValid;
    } else if (step == SignUpStep.password) {
      onChanged = onPasswordChanged!;
      errorText = "Must contain a Captial, a number and a special character";
      conditionForValidity = passwordValid;
    } else if (step == SignUpStep.passwordConfirm) {
      onChanged = onPasswordConfirmChanged;
      errorText = "passwords don't match";
      conditionForValidity = passwordsMatch;
    }
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.black, Colors.deepPurple],
                stops: [0.4, 1])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mainTitle(),
            Row(
              children: [
                Spacer(),
                Column(
                  crossAxisAlignment: step == SignUpStep.finish
                      ? CrossAxisAlignment.center
                      : CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(bottom: 5, left: 10),
                        child: Text(
                          titleFind(),
                          style: titleTextStyle(),
                        )),
                    step == SignUpStep.name ||
                            step == SignUpStep.password ||
                            step == SignUpStep.passwordConfirm ||
                            step == SignUpStep.email
                        ? Container(
                            width: 900,
                            height: 50,
                            child: TextField(
                                onChanged: onChanged,
                                obscureText: step == SignUpStep.password ||
                                    step == SignUpStep.passwordConfirm,
                                decoration: InputDecoration(
                                    errorText: conditionForValidity == false
                                        ? errorText
                                        : null,
                                    hintText: findPlaceholderText(),
                                    hintStyle: TextStyle(
                                        color: Colors.white.withOpacity(0.9),
                                        fontStyle: FontStyle.italic,
                                        fontFamily: "San Francisco",
                                        fontSize: 15),
                                    prefixIcon: findIcon(),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            color: Colors.white, width: 3)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            color: Colors.deepOrange,
                                            width: 3))),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "San Francisco")),
                          )
                        : (step == SignUpStep.pic
                            ? picContainer(selectedPic)
                            : Column(children: [
                                picContainer(selectedPic),
                                Row(children: [
                                  Icon(CupertinoIcons.person_alt,
                                      color: Colors.white, size: 15),
                                  Text(selectedName ?? "Orestis Dimitriou",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "San Francisco",
                                          fontStyle: FontStyle.italic,
                                          fontSize: 14))
                                ]),
                                SizedBox(height: 7),
                                Row(children: [
                                  Icon(CupertinoIcons.mail,
                                      color: Colors.white, size: 15),
                                  SizedBox(width: 5),
                                  Text(
                                      selectedEmail ??
                                          "renosdimitriou01@gmail.com",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "San Francisco",
                                          fontStyle: FontStyle.italic,
                                          fontSize: 14))
                                ]),
                                SizedBox(height: 10)
                              ])),
                  ],
                ),
                Spacer()
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                step == SignUpStep.email
                    ? Container()
                    : TextButton(
                        child: Text("Back",
                            style: TextStyle(
                                fontFamily: "San Francisco",
                                fontSize: 16,
                                color: Colors.white,
                                fontStyle: FontStyle.italic)),
                        onPressed: () {
                          previousPage;
                        },
                      ),
                step == SignUpStep.finish
                    ? Container()
                    : TextButton(
                        child: Text("Next",
                            style: TextStyle(
                                fontFamily: "San Francisco",
                                fontSize: 16,
                                color: Colors.white,
                                fontStyle: FontStyle.italic)),
                        onPressed: nextPage),
              ],
            ),
            Spacer(),
            SignUpFooter(step: step)
          ],
        ),
      ),
    );
  }

  @override
  SignUpFormFormat copyWith(
      {bool? emailValid,
      bool? formInProgress,
      void Function()? nextPage,
      Function(String)? onEmailChanged,
      Function(String)? onPasswordChanged,
      Function(String)? onPasswordConfirmChanged,
      void Function()? onSubmit,
      bool? passwordValid,
      bool? passwordsMatch,
      void Function()? previousPage,
      String? selectedEmail,
      String? selectedName,
      XFile? selectedPic,
      SignUpStep? step}) {
    return SignUpForm(
      emailValid: emailValid ?? this.emailValid,
      formInProgress: formInProgress ?? this.formInProgress,
      nextPage: nextPage ?? this.nextPage,
      onEmailChanged: onEmailChanged ?? this.onEmailChanged,
      onPasswordChanged: onPasswordChanged ?? this.onPasswordChanged,
      onPasswordConfirmChanged:
          onPasswordConfirmChanged ?? this.onPasswordConfirmChanged,
      onSubmit: onSubmit ?? this.onSubmit,
      passwordValid: passwordValid ?? this.passwordValid,
      passwordsMatch: passwordsMatch ?? this.passwordsMatch,
      previousPage: previousPage ?? this.previousPage,
      selectedEmail: selectedEmail ?? this.selectedEmail,
      selectedName: selectedName ?? this.selectedName,
      selectedPic: selectedPic ?? this.selectedPic,
      step: step ?? this.step,
    );
  }
}
// TODO: implement copyWith

class SignUpFooter extends StatelessWidget {
  final SignUpStep? step;
  const SignUpFooter({super.key, this.step});

  int findIndex() {
    if (step == SignUpStep.email) {
      return 0;
    } else if (step == SignUpStep.name) {
      return 1;
    } else if (step == SignUpStep.password) {
      return 2;
    } else if (step == SignUpStep.passwordConfirm) {
      return 3;
    } else if (step == SignUpStep.pic) {
      return 4;
    } else if (step == SignUpStep.finish) {
      return 5;
    } else {
      return 0;
    }
  }

  List<double> findGradientStops() {
    if (step == SignUpStep.email) {
      return [0, 0.2];
    } else if (step == SignUpStep.name) {
      return [0.1, 0.35];
    } else if (step == SignUpStep.password) {
      return [0.3, 0.5];
    } else if (step == SignUpStep.passwordConfirm) {
      return [0.45, 0.65];
    } else if (step == SignUpStep.pic) {
      return [0.65, 0.85];
    } else {
      return [1, 1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            width: double.infinity,
            height: 4,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.deepOrange, Colors.white],
                    stops: findGradientStops()))),
        Container(
          height: 100,
          child: CupertinoTabBar(
              currentIndex: findIndex(),
              backgroundColor: Colors.transparent,
              activeColor: Colors.deepOrange,
              inactiveColor: Colors.white,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                  CupertinoIcons.mail_solid,
                  shadows: [
                    BoxShadow(
                        color: Colors.deepOrange,
                        blurRadius: 20,
                        spreadRadius: 30)
                  ],
                )),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person_alt, shadows: [
                  BoxShadow(
                      color: Colors.deepOrange,
                      blurRadius: 20,
                      spreadRadius: 30)
                ])),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.padlock, shadows: [
                  BoxShadow(
                      color: Colors.deepOrange,
                      blurRadius: 20,
                      spreadRadius: 30)
                ])),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.padlock_solid, shadows: [
                  BoxShadow(
                      color: Colors.deepOrange,
                      blurRadius: 20,
                      spreadRadius: 30)
                ])),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.person_crop_circle, shadows: [
                  BoxShadow(
                      color: Colors.deepOrange,
                      blurRadius: 20,
                      spreadRadius: 30)
                ])),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.checkmark_alt, shadows: [
                  BoxShadow(
                      color: Colors.deepOrange,
                      blurRadius: 20,
                      spreadRadius: 30)
                ]))
              ]),
        ),
      ],
    );
  }
}
