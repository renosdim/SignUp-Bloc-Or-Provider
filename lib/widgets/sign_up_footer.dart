import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:state_management_project_flutter/auth_requirements/auth_variables_and_funcitons.dart';

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
