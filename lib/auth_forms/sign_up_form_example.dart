import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_management_project_flutter/auth_requirements/auth_variables_and_funcitons.dart';
import 'package:state_management_project_flutter/presentation/sign_up_form.dart';
import 'package:state_management_project_flutter/widgets/pic_container.dart';
import 'package:state_management_project_flutter/widgets/sign_up_footer.dart';

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
                            ? PicContainer(pic: selectedPic)
                            : Column(children: [
                                PicContainer(pic: selectedPic),
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

