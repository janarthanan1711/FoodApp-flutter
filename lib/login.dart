import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/home.dart';
import 'package:flutter_application_3/signup.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "LOGIN PAGE",
                style: TextStyle(
                    fontFamily: 'Varela Round',
                    color: Colors.blueGrey,
                    fontSize: 21,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: AssetImage("images/food.webp"),
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
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email,
                              color: Colors.orange,
                            ),
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.black),
                            labelText: "EMAIL ADDRESS"),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.password,
                              color: Colors.orange,
                            ),
                            labelStyle:
                                TextStyle(fontSize: 15, color: Colors.black),
                            labelText: "PASSWORD"),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          primary: Color.fromARGB(255, 250, 251, 252),
                        ),
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            'Forget Password?',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 3,
                      // ),
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
                                              builder: (context) => home()));
                                    },
                                    child: Text(
                                      "LOGIN",
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
                                'Dont Have An Account?..',
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
                                        builder: (context) => signup()));
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'SIGNUP',
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
