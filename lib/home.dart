// ignore_for_file: unnecessary_new, unnecessary_this, deprecated_member_use
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_3/DrawerMenu.dart';
import 'package:flutter_application_3/main.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _homeState createState() => _homeState();
}

// ignore: camel_case_types
class _homeState extends State<home> with TickerProviderStateMixin {
  late TabController _tabController;
  bool isSearching = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
  }

  double translatex = 0.0;
  double translatey = 0.0;
  double scale = 1;
  bool toggle = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          const DrawerMenu(),
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            transform: Matrix4.translationValues(translatex, translatey, 0)
              ..scale(scale),
            child: ClipRRect(
              borderRadius: (toggle)
                  ? BorderRadius.circular(14)
                  : BorderRadius.circular(0),
              child: Scaffold(
                backgroundColor: const Color.fromARGB(255, 243, 237, 237),
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {
                        toggle = !toggle;
                        if (toggle) {
                          translatex = 200;
                          translatey = 80;
                          scale = 0.9;
                        } else {
                          translatex = 0.0;
                          translatey = 0.0;
                          scale = 1;
                        }
                        setState(() {});
                      },
                      icon: const Icon(Icons.menu, color: Colors.black)),
                  title: !isSearching
                      ? const Text(
                          "FOOD APP",
                          style: TextStyle(
                            color: Color.fromARGB(255, 5, 5, 5),
                            fontFamily: 'Fascinate Inline',
                            fontSize: 30,
                          ),
                        )
                      : const TextField(
                          decoration: InputDecoration(
                              icon: Icon(Icons.search_rounded,
                                  color: Colors.white70),
                              hintStyle: TextStyle(color: Colors.white70),
                              hintText: "Search Some Foods"),
                        ),
                  backgroundColor: const Color.fromARGB(255, 252, 135, 1),
                  centerTitle: true,
                  elevation: 10,
                  actions: <Widget>[
                    isSearching
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                this.isSearching = false;
                              });
                            },
                            icon: const Icon(
                              Icons.cancel_rounded,
                              color: Color.fromARGB(255, 5, 5, 5),
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              setState(() {
                                this.isSearching = true;
                              });
                            },
                            icon: const Icon(
                              Icons.search,
                              color: Color.fromARGB(255, 5, 5, 5),
                            ),
                          ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: InkWell(
                          onTap: () {},
                          child: const Icon(Icons.keyboard_arrow_down_rounded,
                              color: Color.fromARGB(255, 5, 5, 5))),
                    ),
                  ],
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
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
                              labelPadding:
                                  EdgeInsets.only(left: 20, right: 20),
                              labelColor: Colors.black,
                              unselectedLabelColor:
                                  Color.fromARGB(221, 59, 59, 59),
                              tabs: const [
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
                      SizedBox(
                        width: double.maxFinite,
                        height: 280,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            Padding(
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
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  radius: 40,
                                                  backgroundImage: AssetImage(
                                                      "images/idly.jpg"),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  width: 75,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: const [
                                                      Text(
                                                        "Idly",
                                                        style: TextStyle(
                                                            fontSize: 19,
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        'Price: 20',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(11.0),
                                                child: Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
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
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
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
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  radius: 40,
                                                  backgroundImage: AssetImage(
                                                      "images/dosa.jpg"),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  width: 75,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: const [
                                                      Text(
                                                        "Dosa",
                                                        style: TextStyle(
                                                            fontSize: 19,
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        'Price: 25',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(11.0),
                                                child: Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 11,
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
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
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
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  radius: 40,
                                                  backgroundImage: AssetImage(
                                                      "images/chappathi.jpg"),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  width: 75,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: const [
                                                      Text(
                                                        "Roti",
                                                        style: TextStyle(
                                                            fontSize: 19,
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        'Price: 25',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(11.0),
                                                child: Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 11,
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
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
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
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  radius: 40,
                                                  backgroundImage: AssetImage(
                                                      "images/poori.jpg"),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  width: 75,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: const [
                                                      Text(
                                                        "Poori",
                                                        style: TextStyle(
                                                            fontSize: 19,
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        'Price: 30',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(11.0),
                                                child: Container(
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 11,
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
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Text(
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
                                              const Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  radius: 40,
                                                  backgroundImage: AssetImage(
                                                      "images/pongal.jpg"),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  width: 75,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: const [
                                                      Text(
                                                        "Pongal",
                                                        style: TextStyle(
                                                            fontSize: 19,
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        'Price: 40',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(11.0),
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
                                                          Navigator.pop(
                                                              context);
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  radius: 40,
                                                  backgroundImage: AssetImage(
                                                      "images/vada.jpg"),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  width: 75,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: const [
                                                      Text(
                                                        "Vada",
                                                        style: TextStyle(
                                                            fontSize: 19,
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        'Price: 10',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(11.0),
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 11),
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
                                                          Navigator.pop(
                                                              context);
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  radius: 40,
                                                  backgroundImage: AssetImage(
                                                      "images/ravakesari.jpg"),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  width: 75,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: const [
                                                      Text(
                                                        "Kichdy",
                                                        style: TextStyle(
                                                            fontSize: 19,
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        'Price: 40',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(11.0),
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
                                                          Navigator.pop(
                                                              context);
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: CircleAvatar(
                                                  radius: 40,
                                                  backgroundImage: AssetImage(
                                                      "images/veg_fries.jpg"),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(15.0),
                                                child: Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  width: 75,
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: const [
                                                      Text(
                                                        "Fried Rice",
                                                        style: TextStyle(
                                                            fontSize: 19,
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      Text(
                                                        'Price: 70',
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Varela Round',
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(11.0),
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 11),
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
                                                          Navigator.pop(
                                                              context);
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Chicken Biriyani",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 100',
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Mutton Biriyani",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 130',
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Egg Biriyani",
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Chilli Chicken",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 60',
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                  "images/mutton_fry.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Mutton Chukka",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 110',
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Grill Chicken",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 300',
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Mutton Pepper",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 120',
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                  "images/parotta.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Parotta",
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Dragon Chicken",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 115',
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                  "images/icecream.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Ice Cream",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 50',
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                  "images/brownies.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Brownie",
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Salad",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 60',
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Cheese Cake",
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                  "images/cookies.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Cookies",
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                  "images/cup_cake.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Cup Cake",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 50',
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                  "images/bhel_puri.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Bhel Puri",
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                              backgroundImage: AssetImage(
                                                  "images/pani_puri.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Pani Puri",
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                              backgroundImage: AssetImage(
                                                  "images/samosa.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Samosa",
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                              backgroundImage: AssetImage(
                                                  "images/shawarma.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Shawarma",
                                                    style: TextStyle(
                                                        fontSize: 18,
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                              backgroundImage: AssetImage(
                                                  "images/burger1.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Burger",
                                                    style: TextStyle(
                                                        fontSize: 19,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 90',
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Choco",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 90',
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                              backgroundImage: AssetImage(
                                                  "images/venilla.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Venilla",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 80',
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                              backgroundImage: AssetImage(
                                                  "images/apple.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Apple",
                                                    style: TextStyle(
                                                        fontSize: 18,
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                              backgroundImage: AssetImage(
                                                  "images/orange.jpg"),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(15.0),
                                            child: Container(
                                              width: 90,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Orange",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontFamily:
                                                            'Varela Round',
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  Text(
                                                    'Price: 60',
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  Text(
                                                    "Lemon",
                                                    style: TextStyle(
                                                        fontSize: 18,
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
                                              margin:
                                                  EdgeInsets.only(left: 12.0),
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
          ),
        ],
      ),
    );
  }
}


  // final foods = [
  //   'idly',
  //   'dosa',
  //   'poori',
  //   'chappathi',
  //   'pongal',
  //   'vegfries',
  //   'kichdy',
  //   'vada',
  //   'chicken biriyani',
  //   'mutton biriyani',
  //   'egg biriyani',
  //   'chilli chicken',
  //   'mutton chukka',
  //   'grill chicken',
  //   'parotta',
  //   'mutton pepper',
  //   'dragon chicken',
  //   'ice cream',
  //   'cookies',
  //   'cakes',
  //   'shawarma',
  //   'bhel puri',
  //   'pani puri',
  //   'burger',
  //   'samosa',
  //   'choco shakes',
  //   'venilla shakes',
  //   'apple shakes',
  //   'lemon shakes',
  // ];
  // final recentFoods = [
  //   'chicken biriyani',
  //   'mutton biriyani',
  //   'shawarma',
  //   'burger',
  //   'grill chiecken',
  //   'chilli chicken',
  // ];

