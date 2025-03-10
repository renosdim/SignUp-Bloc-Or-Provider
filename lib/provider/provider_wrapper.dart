import "package:flutter/material.dart";
import "package:provider/provider.dart";
import "package:state_management_project_flutter/auth_requirements/auth_variables_and_funcitons.dart";
import "package:state_management_project_flutter/presentation/sign_up_form.dart";

import "../presentation/animation_wrapper.dart";
import "auth_notifier.dart";

class SignUpWrapper extends StatelessWidget {
  final SignUpFormFormat widget;
  SignUpWrapper({super.key, required this.widget});
  SignUpStep? previousStep;
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SignUpNotifier(),
    child: Consumer<SignUpNotifier>(
      builder: (BuildContext context, SignUpNotifier notifier, Widget? child) {
        int nowIndex = SignUpStep.values.indexOf(notifier.signUpStep!);
        int? prevIndex = previousStep !=null ? SignUpStep.values.indexOf(previousStep!) : null;
        bool shouldAnimate = prevIndex == null ? previousStep != notifier.signUpStep : nowIndex > prevIndex;
        bool shouldAnimateBack = prevIndex == null ? false : nowIndex < prevIndex;
        previousStep = notifier.signUpStep;
        return AnimationWrapper(
          shouldAnimate:shouldAnimate,
          shouldAnimateBack: shouldAnimateBack,
          key: ValueKey('Animate_${shouldAnimate}_Back_${shouldAnimateBack}'),
          child: widget.copyWith(
            onEmailChanged: context.read<SignUpNotifier>().onEmailChanged,
            onPasswordChanged: context.read<SignUpNotifier>().onPasswordChanged,
            onPasswordConfirmChanged: context.read<SignUpNotifier>().onPasswordsMatch,
            onNameChanged: context.read<SignUpNotifier>().onNameChanged,
            selectedEmail: context.read<SignUpNotifier>().email,
            nextPage: context.read<SignUpNotifier>().nextStep,
            selectedName: context.read<SignUpNotifier>().name,
            previousPage: context.read<SignUpNotifier>().previousStep,
            onSubmit: context.read<SignUpNotifier>().onSignUp,
            step: context.read<SignUpNotifier>().signUpStep,
            selectedPic: context.read<SignUpNotifier>().pic,
            onPicChanged: context.read<SignUpNotifier>().onPicChanged,
            confirmedPassword: context.read<SignUpNotifier>().passwordVerified,
            selectedPassword: context.read<SignUpNotifier>().password,
            controller: context.read<SignUpNotifier>().controller
          ),
        );
      },
    ));
  }
}

