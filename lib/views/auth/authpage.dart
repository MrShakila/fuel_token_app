import 'package:flutter/material.dart';
import 'package:fuel_token_app/views/auth/signin.dart';
import 'package:fuel_token_app/views/auth/signup.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isShowLoginPage = false;
  void togglescreens() {
    setState(() {
      isShowLoginPage = !isShowLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isShowLoginPage) {
      return SignIn(
        isShowLoginPage: togglescreens,
      );
    } else {
      return SignUp(
        isShowLoginPage: togglescreens,
      );
    }
  }
}
