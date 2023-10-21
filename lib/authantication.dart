import 'package:flutter/material.dart';
import 'package:wallet/login.dart';
import 'package:wallet/signup.dart';

class Authanticate extends StatefulWidget {
  const Authanticate({Key? key}) : super(key: key);

  @override
  State<Authanticate> createState() => _AuthanticateState();
}

class _AuthanticateState extends State<Authanticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if(showSignIn) {
      return SignIn(toggleView : toggleView);
    }
    else {
      return Register(toggleView: toggleView);
    }
  }
}