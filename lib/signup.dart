import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/login.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black, //Color.fromARGB(255, 241, 161, 69)
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'SIGNUP PAGE',
              style: TextStyle(
                  fontFamily: 'Varela Round',
                  color: Colors.blueGrey,
                  fontSize: 21,
                  fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
              child: Divider(
                thickness: 2,
                color: Colors.blueGrey,
              ),
            ),
            Container(
              margin: EdgeInsets.all(11),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(11),
                color: Colors.grey[400],
              ),
              child: Padding(
                padding: const EdgeInsets.all(11.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_box_rounded,
                              color: Colors.orange,
                            ),
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.black),
                            labelText: "NAME"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.orange,
                            ),
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.black),
                            labelText: "EMAIL ADDRESS"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.call,
                              color: Colors.orange,
                            ),
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.black),
                            labelText: "MOBILE NUMBER"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.orange,
                            ),
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.black),
                            labelText: "PASSWORD"),
                      ),
                    ),
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 366,
                              height: 75,
                              child: Padding(
                                padding: const EdgeInsets.all(11.0),
                                child: RaisedButton(
                                  elevation: 5,
                                  splashColor: Colors.deepOrange,
                                  color: Color.fromARGB(255, 48, 47, 47),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => login()));
                                  },
                                  child: Text(
                                    "SIGNUP",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Container(
                            child: Text(
                              'Already An User?..',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Color.fromARGB(255, 250, 251, 252),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => login()));
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
