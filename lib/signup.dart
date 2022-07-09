import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class signup extends StatefulWidget {
  signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  GlobalKey<FormState> formKeys = GlobalKey<FormState>();
  late String _emails, _passwords, _phone, _name;

  void signUp(BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: _emails, password: _passwords)
          .catchError((onError) {
        print(onError);
      }).then((authUser) {
        if (authUser.user != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => login()));
        }
      });
    } on FirebaseAuthException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black12, //Color.fromARGB(255, 241, 161, 69)
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
                      color: Colors.white,
                      fontSize: 21,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
                  child: Divider(
                    thickness: 2,
                    color: Colors.white,
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
                    child: Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              onSaved: (value) {
                                _name = value!;
                              },
                              validator: ((name) {
                                if (name!.isEmpty)
                                  return "Please enter name";
                                else if (name.length < 2 && name.length > 15)
                                  return "its not valid name";
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
                              keyboardType: TextInputType.emailAddress,
                              onSaved: (value) {
                                _emails = value!;
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
                              keyboardType: TextInputType.phone,
                              onSaved: (value) {
                                _phone = value!;
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
                              keyboardType: TextInputType.visiblePassword,
                              onSaved: (value) {
                                _passwords = value!;
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
                                        color: Color.fromARGB(255, 48, 47, 47),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      login()));
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
                                    if (formKeys.currentState!.validate()) {
                                      (formKeys.currentState?.save());
                                      signUp(context);
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => login()));
                                    }
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

class Utils {
  GlobalKey<ScaffoldMessengerState> messengerKey =
      GlobalKey<ScaffoldMessengerState>();
  static showSnackBar(String? text) {
    if (text == null) return;

    final snackBar = SnackBar(content: Text(text));
    // ignore: prefer_typing_uninitialized_variables
    var messengerKey;
    messengerKey.currentState!
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
// ScaffoldMessengerKey: Utils.messengerKey,