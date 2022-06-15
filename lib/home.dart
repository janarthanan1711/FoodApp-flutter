// ignore_for_file: unnecessary_new

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

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
        backgroundColor: const Color.fromARGB(255, 39, 24, 66),
        appBar: AppBar(
          title: const Text(
            "FOOD APP",
            style: const TextStyle(
              color: const Color.fromARGB(255, 5, 5, 5),
              fontFamily: 'Fascinate Inline',
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 113, 125, 179),
          centerTitle: true,
          elevation: 10,
          actions: <Widget>[
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  color: const Color.fromARGB(255, 39, 24, 66),
                )),
            IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: const Color.fromARGB(255, 39, 24, 66),
                ),
                onPressed: () {}),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: const Color.fromARGB(255, 113, 125, 179),
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
                title: const Text("Request"),
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
                title: const Text("About"),
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
                    dotColor: const Color.fromARGB(255, 113, 125, 179),
                    // dotBgColor: Color.fromARGB(255, 39, 24, 66),
                    dotSpacing: 40,
                  ),
                ),
                Container(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                        controller: _tabController,
                        isScrollable: true,
                        labelPadding: EdgeInsets.only(left: 20, right: 20),
                        labelColor: Colors.white,
                        unselectedLabelColor:
                            Color.fromARGB(255, 113, 125, 179),
                        tabs: [
                          Tab(
                            text: "Veg",
                          ),
                          Tab(
                            text: "NonVeg",
                          ),
                          Tab(
                            text: "Deserts",
                          ),
                          Tab(
                            text: "Chaats",
                          ),
                          Tab(
                            text: "Shakes & Drinks",
                          )
                        ]),
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  height: 500,
                  child: TabBarView(controller: _tabController, children: [
                    Text("hi"),
                    Text("hello"),
                    Text("why"),
                    Text("when"),
                    Text("where"),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
