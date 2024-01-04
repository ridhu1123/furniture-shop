import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/bottomnavigationclasses/discover.dart';
import 'package:irohub_project/bottomnavigationclasses/explore.dart';
import 'package:irohub_project/bottomnavigationclasses/home.dart';
import 'package:irohub_project/cartscreen.dart';
import 'package:irohub_project/colections.dart';

import 'package:irohub_project/profilepage.dart';

import 'categoryscreen.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homescreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Homescreen extends StatefulWidget {
  Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List<Color> iconcolor = [Colors.white, Colors.black, Colors.black];

  var size, height, width;
  bool _isfavourite = false;
  int favouritecount = 0;
  void favourite() {
    setState(() {
      if (_isfavourite) {
        favouritecount -= 1;
        _isfavourite = false;
      } else {
        favouritecount += 1;
        _isfavourite = true;
      }
    });
  }

  int _selectedIndex = 0;
  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void onitemindex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  getData() async {
    var res = await FirebaseFirestore.instance
        .collection('products')
        .doc("6ZWMSD5OYrzLRafbg16q")
        .collection("Gino safaiojg light")
        .doc("msO5nJawWFu6BcCpJisV")
        .get();
    print(res.data());
  }

  var products = [
    {
      "proName": "chair",
      "image":
          "https://i.pinimg.com/564x/6a/b7/0b/6ab70b6a8be0d0ce83d040d60fb31d70.jpg",
      "price": "90"
    },
    {
      "proName": "bench",
      "image":
          "https://i.pinimg.com/564x/a0/62/7f/a0627fd70e1dbb483eeb266e5d64e705.jpg",
      "price": "900"
    },
    {
      "proName": "tv",
      "image":
          "https://i.pinimg.com/564x/5a/d4/51/5ad451c14ea927c13e7ac1f818436bbd.jpg",
      "price": "34"
    },
    {
      "proName": "washing machine",
      "image":
          "https://i.pinimg.com/564x/36/67/af/3667af9a3914ce53010ee274f7e3ba31.jpg",
      "price": "34"
    }
  ];

  postPro() async {
    for (var i in products) {
      print(i);
      await FirebaseFirestore.instance
          .collection("products")
          .doc("new")
          .collection(i["proName"] ?? "TEST")
          .doc("details")
          .set(i);
    }
  }

  List screens = [Home(), Explorescreen(), Discover()];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: SafeArea(
          child: ListView(
            children: [
              DrawerHeader(
                  child: Column(
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close))),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profilepage()));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                            "https://img.freepik.com/free-vector/handsome-man-face-cartoon_1308-150481.jpg"),
                      ),
                      title: Text(
                        "Gregory Bates",
                        style: GoogleFonts.robotoSlab(),
                      ),
                      subtitle: Text(
                        "samir.runte@newell.org",
                        style: GoogleFonts.robotoSlab(
                            color: Colors.grey, fontSize: 10),
                      ),
                    ),
                  ),
                ],
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Row(
                    children: [
                      Icon(Icons.home),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Home",
                        style: GoogleFonts.robotoSlab(),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Collections()));
                  },
                  icon: Row(
                    children: [
                      Icon(Icons.collections_bookmark_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Collections",
                        style: GoogleFonts.robotoSlab(),
                      )
                    ],
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    postPro();
                  },
                  child: Text('clickccc')),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Row(
                    children: [
                      Icon(Icons.deblur),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Top Deals",
                        style: GoogleFonts.robotoSlab(),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => categoryscreen()));
                  },
                  icon: Row(
                    children: [
                      Icon(Icons.category_rounded),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Categories",
                        style: GoogleFonts.robotoSlab(),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Settings",
                        style: GoogleFonts.robotoSlab(),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {},
                  icon: Row(
                    children: [
                      Icon(Icons.logout_sharp),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Sign out",
                        style: GoogleFonts.robotoSlab(),
                      )
                    ],
                  ),
                ),
              ),
              // Text(
              //   "about this app",
              //   style: GoogleFonts.robotoSlab(),
              // )
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            screens[_selectedIndex],
            ListTile(
              leading: IconButton(
                onPressed: () {
                  _openDrawer();
                },
                icon: Icon(Icons.menu, color: Colors.black),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => Sofa()));
                    },
                    icon: Icon(
                      Icons.search_outlined,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => cartscreen()));
                    },
                    icon: Icon(
                      Icons.shopify_outlined,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: onitemindex,
      ),
    );
  }
}
