// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'SignupPage.dart';

main() {
  runApp(SignUp());
}

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Signup',
      home: SignupPage(),
    );
  }
}
