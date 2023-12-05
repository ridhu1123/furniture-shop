import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/bottomnavigationclasses/discover.dart';
import 'package:irohub_project/bottomnavigationclasses/explore.dart';
import 'package:irohub_project/bottomnavigationclasses/home.dart';
import 'package:irohub_project/cartscreen.dart';
import 'package:irohub_project/colections.dart';
import 'package:irohub_project/imageclass/classA.dart';
import 'package:irohub_project/imageclass/classB.dart';
import 'package:irohub_project/imageclass/classC.dart';
import 'package:irohub_project/profilepage.dart';
import 'package:irohub_project/thankupage.dart';
import 'package:irohub_project/widget/textandshowall.dart';

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
  // List exploreimage = [
  //   "https://i.pinimg.com/564x/79/91/58/799158da597625ffa054d48fecdef369.jpg",
  //   "https://i.pinimg.com/564x/f1/20/ba/f120ba0160225cf18a564a67e3bb22c6.jpg",
  //   "https://i.pinimg.com/564x/df/66/0e/df660ef6ec3351b9c8ef06606661893e.jpg"
  // ];
  // List newarrivals = [
  //   "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
  //   "assets/40446cd0-7055-4954-89fa-e2bb3c0ecb5b.jpg",
  //   "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
  //   "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
  //   "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
  //   "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
  //   "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
  //   "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
  // ];
  // List newarrivalsname = [
  //   "Nancy chair",
  //   "Nancy chair",
  //   "Nancy chair",
  //   "Nancy chair",
  //   "Nancy chair",
  //   "Nancy chair",
  //   "Nancy chair",
  //   "Nancy chair",
  // ];
  // List newarrivalsprize = [
  //   "€29.00",
  //   "€29.00",
  //   "€29.00",
  //   "€29.00",
  //   "€29.00",
  //   "€29.00",
  //   "€29.00",
  //   "€29.00",
  // ];
  // List explorename = ["Sofa", "Lamps", "Chair"];
  // List exploreitems = ["10", "5", "6"];
  List<Color> iconcolor = [Colors.white, Colors.black, Colors.black];
  // List slideimage = [ClassA(), ClassB(), CLassC()];
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
              IconButton(
                onPressed: () {},
                icon: Row(
                  children: [
                    Icon(Icons.home),
                    Text(
                      "Home",
                      style: GoogleFonts.robotoSlab(),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Collections()));
                },
                icon: Row(
                  children: [
                    Icon(Icons.collections_bookmark_outlined),
                    Text(
                      "Collections",
                      style: GoogleFonts.robotoSlab(),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Row(
                  children: [
                    Icon(Icons.deblur),
                    Text(
                      "Top Deals",
                      style: GoogleFonts.robotoSlab(),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => categoryscreen()));
                },
                icon: Row(
                  children: [
                    Icon(Icons.category_rounded),
                    Text(
                      "Categories",
                      style: GoogleFonts.robotoSlab(),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Row(
                  children: [
                    Icon(Icons.settings),
                    Text(
                      "Settings",
                      style: GoogleFonts.robotoSlab(),
                    )
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Row(
                  children: [
                    Icon(Icons.logout_sharp),
                    Text(
                      "Sign out",
                      style: GoogleFonts.robotoSlab(),
                    )
                  ],
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
                  Icon(
                    Icons.search_outlined,
                    color: Colors.black,
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
