// ignore_for_file: unnecessary_new

// import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_3/main.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(
            255, 243, 237, 237), //Color.fromARGB(255, 39, 24, 66)
        appBar: AppBar(
          title: Text(
            "FOOD APP",
            style: const TextStyle(
              color: const Color.fromARGB(255, 5, 5, 5),
              fontFamily: 'Fascinate Inline',
            ),
          ),
          backgroundColor: Color.fromARGB(255, 252, 135, 1),
          centerTitle: true,
          elevation: 10,
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.search,
                color: const Color.fromARGB(255, 48, 47, 47),
              ),
            ),
          ],
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 187, 178, 178),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 252, 188, 93),
                ),
                child: Column(
                  children: [
                    const Center(
                      child: const CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage("images/account.jpg"),
                      ),
                    ),
                    Container(
                      child: const Text(
                        "Account",
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                            color: const Color.fromARGB(255, 5, 5, 5)),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                title: const Text("Favourite"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Share"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Settings"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text("Exit"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 270,
                  child: Carousel(
                    boxFit: BoxFit.fill,
                    images: [
                      Image.asset("images/biriyani.jpg"),
                      Image.asset("images/parotta.jpg"),
                      Image.asset("images/burger1.jpg"),
                      Image.asset("images/grilled_chicken.jpg"),
                      Image.asset("images/shawarma.jpg")
                    ],
                    autoplay: false,
                    dotColor: Color.fromARGB(255, 252, 135, 1),
                    // dotBgColor: Color.fromARGB(255, 39, 24, 66),
                    dotSpacing: 40,
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromARGB(255, 252, 135, 1)),
                        controller: _tabController,
                        isScrollable: true,
                        labelPadding: EdgeInsets.only(left: 20, right: 20),
                        labelColor: Colors.black,
                        unselectedLabelColor: Color.fromARGB(221, 44, 44, 44),
                        tabs: [
                          Tab(
                              child: Text(
                            "Veg",
                            style: TextStyle(
                              fontFamily: 'Varela Round',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )),
                          Tab(
                              child: Text(
                            "NonVeg",
                            style: TextStyle(
                              fontFamily: 'Varela Round',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )),
                          Tab(
                              child: Text(
                            'Deserts',
                            style: TextStyle(
                              fontFamily: 'Varela Round',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )),
                          Tab(
                              child: Text(
                            "Chaats",
                            style: TextStyle(
                              fontFamily: 'Varela Round',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )),
                          Tab(
                              child: Text(
                            "Shakes & Drinks",
                            style: TextStyle(
                              fontFamily: 'Varela Round',
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          )),
                        ]),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 280,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: ListView(
                            scrollDirection: Axis.vertical,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  color: Color.fromARGB(255, 201, 196, 194),
                                  child: Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              radius: 40,
                                              backgroundImage:
                                                  AssetImage("images/idly.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              width: 75,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Idly",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 20',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(11.0),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 11.0,
                                                  horizontal: 10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      // Navigator.pop(context);
                                                    },
                                                    icon: const Icon(
                                                        Icons.favorite),
                                                  ),
                                                  RaisedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Order",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  color: Color.fromARGB(255, 201, 196, 194),
                                  child: Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              radius: 40,
                                              backgroundImage:
                                                  AssetImage("images/dosa.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              width: 75,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Dosa",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 25',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(11.0),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 11, horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      // Navigator.pop(context);
                                                    },
                                                    icon: const Icon(
                                                        Icons.favorite),
                                                  ),
                                                  RaisedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Order",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  color: Color.fromARGB(255, 201, 196, 194),
                                  child: Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              radius: 40,
                                              backgroundImage: AssetImage(
                                                  "images/chappathi.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              width: 75,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Roti",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 25',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(11.0),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 11, horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      // Navigator.pop(context);
                                                    },
                                                    icon: const Icon(
                                                        Icons.favorite),
                                                  ),
                                                  RaisedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Order",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  color: Color.fromARGB(255, 201, 196, 194),
                                  child: Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              radius: 40,
                                              backgroundImage: AssetImage(
                                                  "images/poori.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              width: 75,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Poori",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 30',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(11.0),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 11, horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      // Navigator.pop(context);
                                                    },
                                                    icon: const Icon(
                                                        Icons.favorite),
                                                  ),
                                                  RaisedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Order",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  color: Color.fromARGB(255, 201, 196, 194),
                                  child: Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              radius: 40,
                                              backgroundImage: AssetImage(
                                                  "images/pongal.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              width: 75,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Pongal",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 40',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(11.0),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 11.0,
                                                  horizontal: 10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      // Navigator.pop(context);
                                                    },
                                                    icon: const Icon(
                                                        Icons.favorite),
                                                  ),
                                                  RaisedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Order",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  color: Color.fromARGB(255, 201, 196, 194),
                                  child: Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              radius: 40,
                                              backgroundImage:
                                                  AssetImage("images/vada.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              width: 75,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Vada",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 10',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(11.0),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 11),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      // Navigator.pop(context);
                                                    },
                                                    icon: const Icon(
                                                        Icons.favorite),
                                                  ),
                                                  RaisedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Order",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  color: Color.fromARGB(255, 201, 196, 194),
                                  child: Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              radius: 40,
                                              backgroundImage: AssetImage(
                                                  "images/ravakesari.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              width: 75,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Kichdy",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 40',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(11.0),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 11.0,
                                                  horizontal: 10),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      // Navigator.pop(context);
                                                    },
                                                    icon: const Icon(
                                                        Icons.favorite),
                                                  ),
                                                  RaisedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Order",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 100,
                                  color: Color.fromARGB(255, 201, 196, 194),
                                  child: Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: CircleAvatar(
                                              radius: 40,
                                              backgroundImage: AssetImage(
                                                  "images/veg_fries.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              margin: EdgeInsets.only(top: 10),
                                              width: 75,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    "Fried Rice",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 70',
                                                    style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(11.0),
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 10, vertical: 11),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      // Navigator.pop(context);
                                                    },
                                                    icon: const Icon(
                                                        Icons.favorite),
                                                  ),
                                                  RaisedButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: Text(
                                                      "Order",
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontSize: 15,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            "images/chicken_biriyani.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Chicken Biriyani",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 100',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            "images/mutton_biriyani.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Mutton Biriyani",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 130',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            "images/egg_biriyani.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Egg Biriyani",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 70',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            "images/chiili_chicken.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Chilli Chicken",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 60',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/mutton_fry.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Mutton Chukka",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 110',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            "images/grill_chicken.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Grill Chicken",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 300',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            "images/mutton_pepper.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Mutton Pepper",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 120',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/parotta.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Parotta",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 20',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            "images/chicken_manchurian.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Dragon Chicken",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 115',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/icecream.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Ice Cream",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 50',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/brownies.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Brownie",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 70',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            "images/fruit_salad.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Salad",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 60',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            "images/cheese_cake.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Cheese Cake",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 40',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/cookies.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Cookies",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 30',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/cup_cake.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Cup Cake",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 50',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/bhel_puri.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Bhel Puri",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 25',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 90,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/pani_puri.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Pani Puri",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 20',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 90,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/samosa.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Samosa",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 30',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 90,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/shawarma.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Shawarma",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 40',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 90,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/burger1.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Burger",
                                              style: TextStyle(
                                                  fontSize: 19,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 90',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 100,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage: AssetImage(
                                            "images/choco_milkshake.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Choco",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 90',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 90,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/venilla.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Venilla",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 80',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 90,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/apple.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Apple",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 70',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 90,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/orange.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Orange",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 60',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 90,
                                color: Color.fromARGB(255, 201, 196, 194),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 40,
                                        backgroundImage:
                                            AssetImage("images/lime.jpg"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Container(
                                        width: 90,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Lemon",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              'Price: 30',
                                              style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(11.0),
                                      child: Container(
                                        margin: EdgeInsets.only(left: 12.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            IconButton(
                                              onPressed: () {
                                                // Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.favorite),
                                            ),
                                            RaisedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text(
                                                "Order",
                                                style: TextStyle(
                                                  fontFamily: 'Varela Round',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
 // child: Column(
//   children: [ListTile()],
// ),