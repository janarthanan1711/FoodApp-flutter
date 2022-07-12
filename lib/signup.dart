// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_application_3/model/userModel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  final GlobalKey<FormState> formKeys = GlobalKey<FormState>();
  // late String _emails, _passwords, _phone, _name;

  final _name = TextEditingController();
  final _emails = TextEditingController();
  final _phone = TextEditingController();
  final _passwords = TextEditingController();
  final _uid = TextEditingController();

  final _auth = FirebaseAuth.instance;

  void signUp(
    BuildContext context,
    String _emails,
    String _passwords,
    String _name,
    String _phone,
    String _uid,
  ) async {
    (formKeys.currentState?.validate());
    await _auth
        .createUserWithEmailAndPassword(
          email: _emails,
          password: _passwords,
        )
        .then((user) => {
              postDetailsToFirestore(),
              if (user.user != null)
                {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => login())),
                }
            })
        .catchError((e) {
      Fluttertoast.showToast(msg: e!.message);
    });
    //   .catchError((onError) {
    // print(onError);
    // });
    // .then((authUser) {
    //   if (authUser.user != null) {
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (context) => login()));
    //   }
    // });
  }
  // void signUp(String _emails, String _passwords) async {
  //   if (formKeys.currentState!.validate()) {
  //     await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(email: _emails, password: _passwords)
  //         .then((value) => {postDetailsToFirestore()})
  //         .catchError((e) {
  //       Fluttertoast.showToast(msg: e!.message);
  //     });
  //   }
  // }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  postDetailsToFirestore() async {
    //calling our firestore
    //calling our usermodel
    //sending these values
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    userModel usermodel = userModel(
      uid: 'uid',
      name: 'name',
      email: 'email',
      phone: 'phone',
      password: 'password',
    );

    usermodel.email = user!.email;
    usermodel.uid = user.uid;
    usermodel.name = _name.text;
    usermodel.password = _passwords.text;
    usermodel.phone = _phone.text;

    await firebaseFirestore
        .collection('userDatas')
        .doc(user.uid)
        .set(usermodel.toMap());
    Fluttertoast.showToast(msg: 'Account Created Successfully');

    Navigator.push(context, MaterialPageRoute(builder: (context) => login()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white70, //Color.fromARGB(255, 241, 161, 69)
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'SIGNUP PAGE',
                  style: TextStyle(
                      fontFamily: 'Varela Round',
                      color: Colors.orange,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                  child: Divider(
                    thickness: 2,
                    color: Colors.orange,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11),
                    color: Colors.grey[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(11.0),
                    child: Form(
                      key: formKeys,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              controller: _name,
                              onSaved: (name) {
                                _name.text = name!;
                              },
                              validator: ((name) {
                                if (name!.isEmpty) {
                                  return "Please enter name";
                                } else if (name.length < 2 &&
                                    name.length > 15) {
                                  return "its not valid name";
                                }
                                return null;
                              }),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.account_box_rounded,
                                    color: Colors.orange,
                                  ),
                                  labelStyle: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  labelText: "NAME"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: _emails,
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (email) {
                                _emails.text = email!;
                              },
                              validator: ((email) {
                                if (email!.isEmpty)
                                  return "Please enter email";
                                else if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(email)) {
                                  return "Invalid email";
                                }
                                return null;
                              }),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.orange,
                                  ),
                                  labelStyle: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  labelText: "EMAIL ADDRESS"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: _phone,
                              keyboardType: TextInputType.phone,
                              onSaved: (phone) {
                                _phone.text = phone!;
                              },
                              validator: ((phone) {
                                if (phone!.isEmpty)
                                  return "Please enter Mobile Number";
                                else if (phone.length > 10)
                                  return "Invalid Mobile Number";
                                return null;
                              }),
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.call,
                                    color: Colors.orange,
                                  ),
                                  labelStyle: TextStyle(
                                      fontSize: 15, color: Colors.black),
                                  labelText: "MOBILE NUMBER"),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: TextFormField(
                              controller: _passwords,
                              obscureText: true,
                              onSaved: (password) {
                                _passwords.text = password!;
                              },
                              validator: (password) {
                                if (password!.isEmpty) {
                                  return "Please enter a password";
                                } else if (password.length < 8 ||
                                    password.length > 12) {
                                  return "please enter between 8 to 12 characters";
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.password,
                                    color: Colors.orange,
                                  ),
                                  labelStyle: TextStyle(
                                      fontSize: 15, color: Colors.black),
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
                                        color: Colors.orange,
                                        onPressed: () {
                                          if (formKeys.currentState!
                                              .validate()) {
                                            (formKeys.currentState?.save());
                                            signUp(
                                                context,
                                                _emails.text,
                                                _passwords.text,
                                                _name.text,
                                                _phone.text,
                                                _uid.text);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        login()));
                                            // }
                                          } else {
                                            Fluttertoast.showToast(
                                                msg:
                                                    'Please enter a valid details');
                                          }
                                        },
                                        child: Text(
                                          "SIGNUP",
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(15)),
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
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
