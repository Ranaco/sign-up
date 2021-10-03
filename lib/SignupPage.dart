// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:signup/HomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  var _autovalidate = AutovalidateMode.disabled;
  FirebaseAuth auth = FirebaseAuth.instance;
  String _email = "";
  String _password = "";

  checkAuthentication() async {
    auth.authStateChanges().listen((event) {
      if (event != null) {
        Navigator.pushNamed(context, "/");
      }
    });
  }

  login() {
    if (_key.currentState!.validate()) {}
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SignUp',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Form(
        autovalidateMode: _autovalidate,
        key: _key,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 120.0),
            child: Card(
              elevation: 20,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(
                      10,
                    ),
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.jpeg'),
                          fit: BoxFit.fill),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: TextFormField(
                      validator: (email) {
                        if (email!.isEmpty || email.length < 6) {
                          return 'Email is incorrect';
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter your Email',
                        labelText: "Email",
                      ),
                      onSaved: (email) {
                        _email = email!;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                    leading: Icon(Icons.password),
                    title: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter password',
                        labelText: 'Password',
                      ),
                      validator: (password) {
                        if (password!.isEmpty || password.length < 6) {
                          return "Enter Password";
                        }
                      },
                      onSaved: (password) {
                        _password = password!;
                      },
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _sendToNextScreen();
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                        elevation: 10,
                        primary: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _sendToNextScreen() {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    email: _email,
                    password: _password,
                  )));
    } else {
      setState(() {
        _autovalidate = AutovalidateMode.always;
      });
    }
  }
}
