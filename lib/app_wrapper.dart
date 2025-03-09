import 'package:flutter/material.dart';

abstract class AuthWrapper extends StatelessWidget {
  final Widget Function(
      bool? loggedIn,
      bool? loading,
      bool? isEmailValid,
      bool? isPasswordValid,
      bool? isPasswordVerified,
      String? errorMessage) builder;
  const AuthWrapper({super.key, required this.builder});
}
