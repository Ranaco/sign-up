// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'HomePage.dart';
import 'SignInPage.dart';
import 'SignUpPage.dart';
import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(SignUp());
}

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Signup',
        home: SignIn(),
        routes: {
          '/HomePage': (BuildContext context) => HomePage(),
          '/SignIn': (BuildContext context) => SignIn(),
        });
  }
}
