// ignore_for_file: file_names, prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'SignInPage.dart';

class HomePage extends StatefulWidget {
  String email;
  String password;
  HomePage({Key? key, this.email = '', this.password = ''}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;

  checkAuthentication() async {
    _auth.authStateChanges().listen((event) {
      if (event == null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SignIn()));
      }
    });
  }

  getUser() async {
    User user = await FirebaseAuth.instance.currentUser!;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   checkAuthentication();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: <Widget>[
              Container(
                height: 200,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      Colors.blue,
                      Colors.red,
                    ]),
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.elliptical(
                            MediaQuery.of(context).size.width, 80))),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(50, 130, 0, 0),
                child: GestureDetector(
                  child: Opacity(
                    opacity: 0.6,
                    child: Container(
                        width: 300,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15,
                            ),
                            SizedBox(height: 20, child: Icon(Icons.search)),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 80,
                              child: Text('Search'),
                            )
                          ],
                        )),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo.jpeg'))),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Name :  " + widget.email,
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Password : ' + widget.password,
                        style: TextStyle(fontSize: 20)),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
