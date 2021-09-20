// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String email = "";
  String password = "";
  String url = "";
  String phonenumber = "";
  String calories = "";
  String name = "";
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
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(),
                child: Card(
                  elevation: 10,
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
                          validator: (input) {
                            if (input!.isEmpty) {
                              return 'Enter your name';
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Enter your Email',
                            labelText: "Email",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
