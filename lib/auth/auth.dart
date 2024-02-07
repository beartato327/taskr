import 'package:flutter/material.dart';
import 'package:taskr/screens/login.dart';
import 'package:taskr/screens/signup.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  bool loginOrSignup = true;
  void changeScreen() {
    setState(() {
      loginOrSignup = !loginOrSignup;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loginOrSignup) {
      return Login(changeScreen);
    } else {
      return Signup(changeScreen);
    }
  }
}
