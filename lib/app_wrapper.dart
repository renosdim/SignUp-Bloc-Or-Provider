import 'package:flutter/material.dart';

abstract class AppWrapper extends StatelessWidget {
  final Widget Function(bool? loggedIn, bool? loading, String? errorMessage)
      builder;
  const AppWrapper({super.key, required this.builder});

  @override
  Widget build(BuildContext context);
}
