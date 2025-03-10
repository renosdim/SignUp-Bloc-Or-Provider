import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_project_flutter/auth_forms/sign_up_form_example.dart';
import 'package:state_management_project_flutter/provider/auth_notifier.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => SignUpNotifier(),
      child: MaterialApp(
        home: SignUpForm(),
      ),
    );
  }
}
