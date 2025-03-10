import 'package:flutter/material.dart';
import 'package:state_management_project_flutter/auth_forms/sign_up_form_example.dart';
import 'package:state_management_project_flutter/provider/provider_wrapper.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SignUpWrapper(
        widget: SignUpForm()
      ),
    );
  }
}
