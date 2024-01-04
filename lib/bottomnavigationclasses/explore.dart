import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/Sofa.dart';
import 'package:irohub_project/addtocart.dart';
import 'package:irohub_project/showallscreen.dart';

import 'package:irohub_project/widget/textandshowall.dart';

class Explorescreen extends StatefulWidget {
  const Explorescreen({super.key});

  @override
  State<Explorescreen> createState() => _ExplorescreenState();
}

class _ExplorescreenState extends State<Explorescreen> {
  Map<String, List<String>> folderImageUrls = {};
  List exploreimage = [
    "https://i.pinimg.com/564x/52/9a/86/529a86b9e08ea448582b0be8ecdf2890.jpg",
    "https://i.pinimg.com/564x/2f/92/4b/2f924b5f0c9718be6cd22a5d6b1d145b.jpg",
    "https://i.pinimg.com/564x/73/2c/b5/732cb5ba6d7d18170f0dbfcc24cfc6b1.jpg",
    "https://i.pinimg.com/564x/47/68/5c/47685c3c334ed95b0f3091f0471ccb60.jpg"
  ];
  List explorename = ["Sofa", "Lamps", "Chair", "Clock"];
  List exploreitems = ["6", "6", "6", "6"];

  List Bestsellersname = [
    "Chinese chair",
    "Bret baguette",
    "State of the Art Light",
    "lamp-thai-style",
    "Contemporary chair",
    "Black simple chair",
  ];
  List Bestsellersprise = [
    "€29.00",
    "€39.00",
    "€49.00",
    "€29.00",
    "€19.00",
    "€29.00",
  ];
  var Bestsellers = [];
  void getdata() async {
    var storage = FirebaseStorage.instance;
    var ref = storage.ref().child("homescreenimages/Best sellers");
    var imageurl = await ref.listAll();
    await Future.forEach(imageurl.items, (Reference reference) async {
      var url = await reference.getDownloadURL();
      setState(() {
        Bestsellers.add(url);
        //
      });
    });
  }

  var items = [];
  getcategories() async {
    items.clear();

    var res = await FirebaseFirestore.instance
        .collection("products")
        .doc("categories")
        .get();

    items.addAll(res.data()?["items"]);
    // print("sssssssssss $items");
    setState(() {});
    return items;
    // var res1 = await FirebaseFirestore.instance
    //     .collection("products")
    //     .doc("categories")
    //     .collection(items.toString())
    //     .get();
    // print(res1.docs);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    getcategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 55),
              child: Text(
                "Explore",
                style: GoogleFonts.robotoSlab(
                    fontSize: 30, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LimitedBox(
              maxHeight: 225,
              child: ListView.builder(
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    print(index);
                    print(items[index]);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 146,
                        child: Column(
                          children: [
                            InkWell(
                              onTap: () {
                                print("222222222${items[index]}");
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Sofascreen(
                                            exploreimage: items[index]
                                                ["product"])));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        offset: Offset(3, 3),
                                        blurRadius: 5,
                                        color:
                                            Color.fromARGB(255, 119, 117, 117))
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(6),
                                  child: Image.network(
                                    items[index]["image"],
                                    height: 158,
                                    width: double.infinity,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, left: 8),
                                  child: Text(
                                    items[index]["name"],
                                    style: GoogleFonts.robotoSlab(),
                                  ),
                                )),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    items[index]["items"],
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.grey[400]),
                                  ),
                                ))
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Showallscreen(name: "Best sellers")));
                },
                child: Showallbutton(text: "Best sellers")),
            Container(
              height: 580,
              child: GridView.builder(
                // physics: NeverScrollableScrollPhysics(),
                itemCount: Bestsellers.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 4, crossAxisCount: 2, mainAxisExtent: 250),
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Addtocart1()));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(6)),
                                width: 160,
                                height: 190,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: Image.network(
                                      Bestsellers[index],
                                      fit: BoxFit.fill,
                                    ))),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                Bestsellersname[index],
                                style: GoogleFonts.robotoSlab(),
                              )),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                Bestsellersprise[index],
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.grey[400]),
                              ))
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }



  
}
