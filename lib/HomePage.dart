// ignore_for_file: file_names, prefer_const_constructors
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  String? email;
  String? password;
  HomePage({Key? key, this.email, this.password}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
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
          SingleChildScrollView(
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(widget.email!),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
