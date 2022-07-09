import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_3/main.dart';
import 'package:flutter_application_3/home.dart';
import 'package:flutter_application_3/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class login extends StatefulWidget {
  login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late String _email, _password;

  void signIn(BuildContext context) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: _email, password: _password)
        .catchError((onError) {
      print(onError);
    }).then((authUser) {
      if (authUser.user != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.black12,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "LOGIN PAGE",
                    style: TextStyle(
                        fontFamily: 'Varela Round',
                        color: Colors.white,
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
                                if (email!.isEmpty)
                                  return "Please enter email";
                                else if (!RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(email))
                                  return "its not valid email";
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
                            TextFormField(
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
                            TextButton(
                              style: TextButton.styleFrom(
                                primary: Color.fromARGB(255, 250, 251, 252),
                              ),
                              onPressed: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
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
                                          color:
                                              Color.fromARGB(255, 48, 47, 47),
                                          onPressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              (formKey.currentState?.save());
                                              signIn(context);
                                              // if (_email ==
                                              //         "test123@gmail.com" &&
                                              //     _password == "pass@123") {
                                              //   FocusScope.of(context)
                                              //       .unfocus();
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          home()));
                                              // } else {
                                              //   print(
                                              //       "Email and Password is invalid!");
                                              // }
                                            }
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
                                      primary:
                                          Color.fromARGB(255, 250, 251, 252),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => signup()));
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8.0),
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
      ),
    );
  }
}
