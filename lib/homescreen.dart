import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/Sofa.dart';
import 'package:irohub_project/bottomnavigationclasses/discover.dart';
import 'package:irohub_project/bottomnavigationclasses/explore.dart';
import 'package:irohub_project/bottomnavigationclasses/home.dart';
import 'package:irohub_project/cartscreen.dart';
import 'package:irohub_project/colections.dart';

import 'package:irohub_project/profilepage.dart';
import 'package:irohub_project/showallscreen.dart';

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
  var topdeals = [];
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

  getitems() async {
    var res = await FirebaseFirestore.instance
        .collection("homescreenitems")
        .doc("allitems")
        .get();

    topdeals.addAll(res.data()?["topdeals"]);
  }

  var item = [];
  getcategories() async {
    var res = await FirebaseFirestore.instance
        .collection("products")
        .doc("categories")
        .get();

    item.addAll(res.data()?["exploreitems"]);
    print("sssssssssss $item");
    setState(() {});
    return item;
    // var res1 = await FirebaseFirestore.instance
    //     .collection("products")
    //     .doc("categories")
    //     .collection(items.toString())
    //     .get();
    // print(res1.docs);
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
                  onPressed: () {
                    Navigator.pop(context);
                  },
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

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Showallscreen(
                                  name: "Top Trends",
                                  items: topdeals,
                                )));
                  },
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
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: IconButton(
              //     onPressed: () {
              //       print("00000000000000000 ${item}");
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => Sofascreen(
              //                     exploreimage: item,
              //                   )));
              //     },
              //     icon: Row(
              //       children: [
              //         Icon(Icons.category_rounded),
              //         SizedBox(
              //           width: 10,
              //         ),
              //         Text(
              //           "Categories",
              //           style: GoogleFonts.robotoSlab(),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
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
                  getitems();
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
          BottomNavigationBarItem(icon: Icon(Icons.public_rounded), label: "")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: onitemindex,
      ),
    );
  }
}
