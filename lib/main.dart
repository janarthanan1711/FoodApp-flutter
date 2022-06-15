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
      backgroundColor: Color.fromARGB(255, 39, 24, 66),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              "LOGIN SCREEN",
              style: TextStyle(
                  fontFamily: 'Permanent Marker',
                  color: Colors.grey,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),
            ),
            Padding(
              padding: EdgeInsets.all(40.0),
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
                        style: TextStyle(color: Color.fromARGB(255, 4, 0, 22)),
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
                        style: TextStyle(color: Color.fromARGB(255, 4, 0, 22)),
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
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Text(
                        "Forget Password?",
                        style: TextStyle(color: Color.fromARGB(255, 252, 3, 3)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Container(
                          child: RaisedButton(
                            splashColor: Color.fromARGB(255, 247, 5, 186),
                            color: Color.fromARGB(255, 39, 24, 66),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => home()));
                            },
                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
