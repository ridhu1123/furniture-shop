import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/addtocart.dart';
import 'package:irohub_project/showallscreen.dart';

import '../imageclass/classA.dart';
import '../imageclass/classB.dart';
import '../imageclass/classC.dart';
import '../widget/textandshowall.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List exploreimage = [
    "https://i.pinimg.com/564x/79/91/58/799158da597625ffa054d48fecdef369.jpg",
    "https://i.pinimg.com/564x/f1/20/ba/f120ba0160225cf18a564a67e3bb22c6.jpg",
    "https://i.pinimg.com/564x/df/66/0e/df660ef6ec3351b9c8ef06606661893e.jpg"
  ];
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
  List Topdealsname = [
    "Douglas Mont Relaunches French light",
    "Flame Floor Lamp ",
    "Modern Table Lamp",
    "Modern antlantic sofa",
    "Simple modern chair"
  ];
  List topdealssprize = ["€29.00", "€39.00", "€19.00", "€69.00", "€19.00"];
  List Toptrendsname = [
    "Gino Safartty Light",
    "Sofi Pisano",
    "New Melbourne",
    "Avvitament furniture",
  ];
  List newarrivalsname = [
    "Gino Safartty Light",
    "Interactive clocks",
    "Les meubles luxe chair",
    "Lighting _ Handcrafed",
  ];
  List newarrivalsprize = [
    "€29.00",
    "€39.00",
    "€19.00",
    "€69.00",
  ];
  List slideimage = [ClassA(), ClassB(), CLassC()];
  List explorename = ["Sofa", "Lamps", "Chair"];
  List exploreitems = ["10", "5", "6"];

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
  getAllData() async {
    print('''dfdfdfdfdfdfdfdfdf''');
    var res = await FirebaseFirestore.instance
        .collection("products")
        .doc("new")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        print("data exist  ${documentSnapshot.data()}");
      }
    });

    print('--------------------------------');
    setState(() {});
  }

  postPro() async {
    for (var i in products)
      FirebaseFirestore.instance.collection("products").doc("new").set(i);
  }

  var newarriavls = [];
  var Toptrends = [];
  var Topdeals = [];
  void getdata() async {
    var storage = FirebaseStorage.instance;

    var ref = storage.ref().child("homescreenimages/new arrival");
    // print("hhhhhhhhhhhhhhhhhh $ref");
    var ref1 = storage.ref().child("homescreenimages/Top trends");
    var imageurl1 = await ref1.listAll();
    await Future.forEach(imageurl1.items, (Reference reference) async {
      var url1 = await reference.getDownloadURL();

      setState(() {
        Toptrends.add(url1);
        // print("dddddddd $Toptrends");
      });
    });
    var imageurl = await ref.listAll();
    await Future.forEach(imageurl.items, (Reference reference) async {
      var url = await reference.getDownloadURL();
      setState(() {
        newarriavls.add(url);
        // print("dddddddd $newarriavls");
      });
    });

    var ref2 = storage.ref().child("homescreenimages/Top deals");
    var imageurl2 = await ref2.listAll();
    await Future.forEach(imageurl2.items, (Reference reference) async {
      var url2 = await reference.getDownloadURL();
      setState(() {
        Topdeals.add(url2);
        // print("dddddddd $Topdeals");
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    getAllData();
  }

  @override
  Widget build(BuildContext context) {
    var size, height, width;

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(blurRadius: 8, blurStyle: BlurStyle.outer)
            ]),
            height: height / 2.1,
            width: double.infinity,
            child: Stack(
              children: [
                CarouselSlider.builder(
                    unlimitedMode: true,
                    enableAutoSlider: true,
                    autoSliderTransitionTime: Duration(seconds: 1),
                    slideTransform: DefaultTransform(),
                    slideBuilder: (index) {
                      return Stack(
                        children: [
                          slideimage[index],
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20, left: 19),
                              child: Row(
                                children: List.generate(3, (indexeDots) {
                                  return Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Container(
                                      width: index == indexeDots ? 20 : 9,
                                      height: 9,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.black),
                                    ),
                                  );
                                }),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: slideimage.length),
              ],
            ),
          ),
          InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Showallscreen(name: "New Arrivals")));
              },
              child: Showallbutton(text: "New Arrivals")),
          LimitedBox(
            maxHeight: 242,
            child: ListView.builder(
                itemCount: products.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Addtocart1(
                                          proName: products[index]["proName"]
                                              .toString(),
                                        )));
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
                                  products[index]["image"].toString(),
                                  fit: BoxFit.fill,
                                )),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              products[index]["proName"].toString(),
                              style: GoogleFonts.robotoSlab(),
                            )),
                        Text(
                          products[index]["price"].toString(),
                          style:
                              GoogleFonts.robotoSlab(color: Colors.grey[400]),
                        )
                      ],
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
                            Showallscreen(name: "Top Trends")));
              },
              child: Showallbutton(text: "Top Trends")),
          LimitedBox(
            maxHeight: 242,
            child: ListView.builder(
                itemCount: Toptrends.length,
                scrollDirection: Axis.horizontal,
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
                                    builder: (context) => Addtocart1(
                                          toptrends: Toptrends[index],
                                        )));
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
                                    Toptrends[index],
                                    fit: BoxFit.fill,
                                  ))),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              Toptrendsname[index],
                              style: GoogleFonts.robotoSlab(),
                            )),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              newarrivalsprize[index],
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.grey[400]),
                            ))
                      ],
                    ),
                  );
                }),
          ),
          InkWell(
              onTap: () {
                // addditemtostorage();
                //  Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) =>
                //               Showallscreen(name: "Top Deals")));
              },
              child: Showallbutton(text: "Top Deals")),
          LimitedBox(
            maxHeight: 700,
            child: ListView.separated(
                separatorBuilder: (context, index) =>
                    Divider(thickness: 0.5, indent: width / 3.1),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: Topdeals.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Addtocart1(
                                    topdeals: Topdeals[index],
                                  )));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(6)),
                            width: 90,
                            height: 90,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.network(
                                  Topdeals[index],
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 10, top: 8),
                                  child: Text(
                                    Topdealsname[index],
                                    style: GoogleFonts.robotoSlab(),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    topdealssprize[index],
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.grey[400]),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
  // var newarrivals1=[];
  //  Future<void> addditemtostorage()async{
  //     UserCredential userCredential=await FirebaseAuth.instance.signInAnonymously();
  //     var uid=userCredential.user!.uid;
  //     await FirebaseFirestore.instance.collection("users").doc(uid).set({
  //       "image": newarrivals,

  //     });

  // }
}
