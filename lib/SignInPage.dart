// ignore_for_file: file_names, prefer_const_constructors, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:signup/HomePage.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  //Keys and FirebaseAuth;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;
  // auto validating state;
  var _autoValidate;
  //Credentials and vars;
  String _email = "";
  String _password = "";

  checkAuthentication() async {
    _auth.authStateChanges().listen((event) {
      if (event != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return HomePage();
        }));
      }
    });
  }

  @override
  initState() {
    super.initState();
    this.checkAuthentication();
  }

  login() {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'SingUp',
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.white,
        elevation: 10,
        centerTitle: true,
      ),
      body: Form(
        autovalidateMode: _autoValidate,
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
              child: Card(
            child: Column(
              children: <Widget>[
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
                        return "Email is incorrect";
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
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
                    validator: (password) {
                      if (password!.isEmpty || password.length < 6) {
                        return "The password should be atleast 6 characters long";
                      }
                    },
                    onSaved: (password) {
                      _password = password!;
                    },
                    decoration: InputDecoration(
                        hintText: 'Password', labelText: 'Password'),
                    obscureText: true,
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: _TakeToNextScreen,
                  child: Text(
                    'Sign In',
                    style: TextStyle(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 10,
                      primary: Colors.grey.shade300,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)))),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  _TakeToNextScreen() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomePage(
          email: _email,
          password: _password,
        );
      }));
    } else {
      _autoValidate = AutovalidateMode.always;
    }
  }
}
