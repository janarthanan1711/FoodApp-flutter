import 'package:flutter/material.dart';
import 'package:flutter_application_3/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 48, 47, 47),
      body: SafeArea(
        child: Expanded(
          flex: 2,
          child: Column(
            children: [
              Text(
                "LOGIN SCREEN",
                style: TextStyle(
                    fontFamily: 'Varela Round',
                    color: Colors.grey,
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          "Enter your Email",
                          style:
                              TextStyle(color: Color.fromARGB(255, 4, 0, 22)),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                                fontSize: 15, color: Colors.grey.shade400),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5.0),
                        child: Text(
                          "Password",
                          style:
                              TextStyle(color: Color.fromARGB(255, 4, 0, 22)),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                            labelStyle: TextStyle(
                                fontSize: 15, color: Colors.grey.shade400),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
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
                                    splashColor:
                                        Color.fromARGB(255, 182, 159, 221),
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
                              onPressed: () {},
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
