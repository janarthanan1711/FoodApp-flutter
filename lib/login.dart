// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/home.dart';
import 'package:flutter_application_3/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

// ignore: camel_case_types
class _loginState extends State<login> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String _email, _password;

  void signIn(BuildContext context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password)
        .then((authUser) {
      if (authUser.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      }
    }).catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white70,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "LOGIN PAGE",
                  style: TextStyle(
                      fontFamily: 'Varela Round',
                      color: Colors.orange,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage("images/foods.webp"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.grey[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            onSaved: (value) {
                              _email = value!;
                            },
                            validator: ((email) {
                              if (email!.isEmpty) {
                                return "Please enter email";
                              } else if (!RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(email)) {
                                return "its not valid email";
                              }
                              return null;
                            }),
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: Colors.orange,
                                ),
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                labelText: "EMAIL ADDRESS"),
                          ),
                          TextFormField(
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            onSaved: (value) {
                              _password = value!;
                            },
                            validator: (password) {
                              if (password!.isEmpty) {
                                return "Please enter a password";
                              } else if (password.length < 8 ||
                                  password.length > 12) {
                                return "please enter between 8 to 12 characters";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.password,
                                  color: Colors.orange,
                                ),
                                labelStyle: TextStyle(
                                    fontSize: 15, color: Colors.black),
                                labelText: "PASSWORD"),
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              primary: const Color.fromARGB(255, 250, 251, 252),
                            ),
                            onPressed: () {},
                            child: const Padding(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(
                                'Forget Password?',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    width: 366,
                                    height: 75,
                                    child: Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: RaisedButton(
                                        elevation: 5,
                                        splashColor: Colors.deepOrange,
                                        color: Colors.orange,
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            (formKey.currentState?.save());
                                            signIn(context);
                                          } else {
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Please Fill the User Data');
                                          }
                                        },
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: const Text(
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
                                  child: const Text(
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
                                    primary: const Color.fromARGB(
                                        255, 250, 251, 252),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => signup()));
                                  },
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
