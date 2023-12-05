import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/tabbarviewscreen1.dart';
import 'package:irohub_project/tabbarviewscreen2.dart';
import 'package:irohub_project/tabbarviewscreen3.dart';

import 'Filterscreen.dart';

class Categoriessecond extends StatefulWidget {
  const Categoriessecond({super.key});

  @override
  State<Categoriessecond> createState() => _CategoriessecondState();
}

class _CategoriessecondState extends State<Categoriessecond> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text("Decorations",
            style: GoogleFonts.robotoSlab(color: Colors.black)),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Filterscreen()));
              },
              child: Text(
                "Filters",
                style: GoogleFonts.robotoSlab(color: Colors.black),
              ))
        ],
        backgroundColor: Colors.white,
      ),
      body: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            TabBar(
                padding: EdgeInsets.only(top: 20),
                indicatorColor: Colors.white,
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                tabs: [
                  Tab(
                    child: Text(
                      "Featured",
                      style: GoogleFonts.robotoSlab(),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Collection",
                      style: GoogleFonts.robotoSlab(),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Trending",
                      style: GoogleFonts.robotoSlab(),
                    ),
                  ),
                ]),
            Expanded(
              child: TabBarView(children: [
                Featuredscreen(),
                Collectiontabbar(),
                Trendingtabbar()
              ]),
            )
          ],
        ),
      ),
    );
  }
}
