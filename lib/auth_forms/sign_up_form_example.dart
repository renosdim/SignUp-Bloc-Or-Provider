import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:state_management_project_flutter/auth_requirements/auth_variables_and_funcitons.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project_flutter/presentation/sign_up_form.dart';
import 'package:state_management_project_flutter/widgets/pic_container.dart';
import 'package:state_management_project_flutter/widgets/sign_up_footer.dart';
import 'package:state_management_project_flutter/users/user_entity.dart';

import '../presentation/auth_state.dart';
import '../provider/auth_notifier.dart';

class SignUpForm extends SignUpFormFormat {
  //final AuthState? state;

  const SignUpForm({
    super.key,
    super.onNameChanged,
    super.onPicChanged,
    super.onEmailChanged,
    super.onPasswordChanged,
    super.onPasswordConfirmChanged,
    super.onSubmit,
    super.previousPage,
    super.nextPage,
    super.selectedEmail,
    super.selectedName,
    super.selectedPic,
    super.step,
    super.confirmedPassword,
    super.selectedPassword,
    super.controller
  });

  // bool? get emailValid => state is AuthEmailValid
  //     ? true
  //     : (state is AuthEmailInvalid ? false : null);
  // bool? get passwordValid => state is AuthPasswordValid;
  // bool? get passwordsMatch => state is AuthPasswordsMatch;
  // bool? get formInProgress => state is AuthSignUpInProgress;

  String titleFind() {
    switch (step) {
      case SignUpStep.email:
        return "Pass your email:";
      case SignUpStep.pic:
        return "Select a profile pic (Optional):";
      case SignUpStep.name:
        return "Enter your name:";
      case SignUpStep.password:
        return "Enter your password:";
      case SignUpStep.passwordConfirm:
        return "Confirm your password:";
      default:
        return "All Done!";
    }
  }

  Icon findIcon() {
    switch (step) {
      case SignUpStep.email:
        return Icon(CupertinoIcons.mail_solid, color: Colors.white, size: 15);
      case SignUpStep.name:
        return Icon(CupertinoIcons.person_alt, color: Colors.white, size: 15);
      case SignUpStep.password:
        return Icon(CupertinoIcons.padlock, color: Colors.white, size: 15);
      default:
        return Icon(CupertinoIcons.padlock_solid,
            color: Colors.white, size: 15);
    }
  }

  String findPlaceholderText() {
    switch (step) {
      case SignUpStep.email:
        return "We will verify it later...";
      case SignUpStep.name:
        return "It will be displayed in your profile...";
      case SignUpStep.password:
        return "A Capital,a number,a special character...";
      default:
        return "Must match your password exactly...";
    }
  }

  @override
  Widget build(BuildContext context) {

    double size = MediaQuery.of(context).size.width;
    bool mobile = !kIsWeb;

    late Function(String)? onChanged;
    bool? conditionForError;

    if (step == SignUpStep.email) {
      onChanged = onEmailChanged!;
      conditionForError = selectedEmail == null;
    } else if (step == SignUpStep.password) {
      onChanged = onPasswordChanged!;
      conditionForError = selectedPassword == null;
    } else if (step == SignUpStep.passwordConfirm) {
      onChanged = onPasswordConfirmChanged;
      conditionForError = confirmedPassword != true;
    } else if (step == SignUpStep.name) {
      onChanged = onNameChanged!;
      conditionForError = selectedName == null;
    } else if (step == SignUpStep.pic) {
      conditionForError = false;
    }

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.black, Colors.deepPurple],
              stops: [0.4, 1],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20, mobile ? 50: 17, 0, 50),
                child: Text(
                  "Your App Sign - Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: mobile? size * 0.06 : size * 0.03,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: "San Francisco",
                  ),
                ),
              ),
              Row(
                children: [
                  Spacer(),
                  Column(
                    crossAxisAlignment: step == SignUpStep.finish || step == SignUpStep.pic
                        ? CrossAxisAlignment.center
                        : CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 10),
                        child: Text(titleFind(),
                            style: TextStyle(
                              fontFamily: "San Francisco",
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              color: Colors.white,
                              fontSize: 14,
                            )),
                      ),
                      step == SignUpStep.name ||
                              step == SignUpStep.password ||
                              step == SignUpStep.passwordConfirm ||
                              step == SignUpStep.email
                          ? Container(
                              width: size * 0.9,
                              height: 50,
                              child: TextField(
                                onChanged: onChanged,
                                controller: controller,
                                obscureText: step == SignUpStep.password ||
                                    step == SignUpStep.passwordConfirm,
                                decoration: InputDecoration(
                                  hintText: findPlaceholderText(),
                                  hintStyle: TextStyle(
                                    color: Colors.white.withOpacity(0.9),
                                    fontStyle: FontStyle.italic,
                                    fontFamily: "San Francisco",
                                    fontSize: 15,
                                  ),
                                  prefixIcon: findIcon(),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        BorderSide(color: Colors.white, width: 3),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide: BorderSide(
                                        color: Colors.deepOrange, width: 3),
                                  ),
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "San Francisco",
                                ),
                              ),
                            )
                          :
                      (step == SignUpStep.pic?
                      PicContainer(pic: selectedPic, onPicChanged: onPicChanged,) :
                      Column(
                        children: [
                          PicContainer(pic: selectedPic),
                          Row(
                            children: [
                              Icon(CupertinoIcons.person_alt, color: Colors.white, size: 14,),
                              SizedBox(width: 3),
                              Text(selectedName!, style: TextStyle(fontFamily: "San Francisco", fontStyle: FontStyle.italic, fontSize: 14, color: Colors.white))
                            ]
                          ),
                          Row(
                              children: [
                                Icon(CupertinoIcons.mail, color: Colors.white, size: 13,),
                                SizedBox(width: 5),
                                Text(selectedEmail!, style: TextStyle(fontFamily: "San Francisco", fontStyle: FontStyle.italic, fontSize: 14, color: Colors.white))
                              ]
                          )
                        ],
                      )),
                        Row(
                          children: [
                            if (step != SignUpStep.email && step != SignUpStep.finish)
                              TextButton(
                                onPressed: previousPage,
                                child: Text("Back", style: TextStyle(fontFamily: "San Francisco", fontSize: 13, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.white)),
                              ),
                            if (conditionForError == false)
                            TextButton(
                              onPressed: nextPage,
                              child: Text("Next", style: TextStyle(fontFamily: "San Francisco", fontSize: 13, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold, color: Colors.white)),
                            ),
                          ],
                        ),
                    ],
                  ),
                  Spacer(),
                ],
              ),
              Spacer(),
              SignUpFooter(step: step),
            ],
          ),
        ),
      ),
    );
  }

  @override
  SignUpFormFormat copyWith({
    AuthState? state,
    Function(String p1)? onEmailChanged,
    Function(String p1)? onPasswordChanged,
    Function(String p1)? onPasswordConfirmChanged,
    Function(String p1)? onNameChanged,
    Function(XFile p1)? onPicChanged,
    String? selectedEmail,
    String? selectedName,
    String? selectedPassword,
    bool? confirmedPassword,
    XFile? selectedPic,
    SignUpStep? step,
    VoidCallback? onSubmit,
    VoidCallback? nextPage,
    VoidCallback? previousPage,
    TextEditingController? controller,
  }) {
    return SignUpForm(
      onEmailChanged: onEmailChanged ?? this.onEmailChanged,
      onPasswordChanged: onPasswordChanged ?? this.onPasswordChanged,
      onPasswordConfirmChanged: onPasswordConfirmChanged ?? this.onPasswordConfirmChanged,
      selectedEmail: selectedEmail ?? this.selectedEmail,
      selectedName: selectedName ?? this.selectedName,
      selectedPic: selectedPic ?? this.selectedPic,
      step: step ?? this.step,
      onSubmit: onSubmit ?? this.onSubmit,
      nextPage: nextPage ?? this.nextPage,
      previousPage: previousPage ?? this.previousPage,
      onNameChanged: onNameChanged ?? this.onNameChanged,
      onPicChanged: onPicChanged ?? this.onPicChanged,
      confirmedPassword: confirmedPassword ?? this.confirmedPassword,
      selectedPassword: selectedPassword ?? this.selectedPassword,
      controller: controller ?? this.controller
    );
  }
}
