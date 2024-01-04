import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/Filterscreen.dart';
import 'package:irohub_project/addtocart.dart';
import 'package:irohub_project/showallscreen.dart';
import 'package:irohub_project/widget/textandshowall.dart';

import '../collection1page.dart';


class Discover extends StatefulWidget {
  const Discover({super.key});

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  List exploreimage = [
    "https://i.pinimg.com/564x/79/91/58/799158da597625ffa054d48fecdef369.jpg",
    "https://i.pinimg.com/564x/f1/20/ba/f120ba0160225cf18a564a67e3bb22c6.jpg",
    "https://i.pinimg.com/564x/df/66/0e/df660ef6ec3351b9c8ef06606661893e.jpg"
  ];
  List discovername = ["Sofa", "Lamps", "Chair"];
  List discoveritem = ["10", "5", "6"];
  List newarrivals = [
    "assets/BLOTT WORKS - Handmade lamps and clocks - Shop.jpg",
    "assets/SOUTHERN LIGHT.jpg",
    "assets/Wood working projects woodworking plans__woodworking plans furniture.jpg"
  ];
  List carousilimage=[
    "assets/__ World Clock _ Elevenpl.jpg",
    "assets/Realistic Vintage School Wall Clock Sketch Freebie.jpg",
    "assets/fashiontoolsandmotorcycles.jpg"
  ];

  List Trendingname = [
    "Nancy chair",
    "Sofa chair",
    "Furinture chair",
  
  ];
  List Trendingprize = [
    "€29.00",
    "€39.00",
    "€49.00",

  ];
  List Bestsellingname = [
    "Adrian Pearsall sofa",
    "Candelaria Contemporary sofa",
    "Italian Design Three seats sofa",
  
  ];
  var Trending=[];
  var Bestselling=[];
  void getdata()async{
    var storage=FirebaseStorage.instance;
    var ref=storage.ref().child("homescreenimages/Trending");
    var imageurl=await ref.listAll();
    await Future.forEach(imageurl.items, (Reference reference)async {
      var url= await reference.getDownloadURL();
      setState(() {
        Trending.add(url);
      });
    } );
    var ref1=storage.ref().child("homescreenimages/Best selling");
    var imageurl1=await ref1.listAll();

    await Future.forEach(imageurl1.items, (Reference reference) async{
      var url1=await reference.getDownloadURL();
      setState(() {
        Bestselling.add(url1);
      });
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 60),
          child: Text(
            "Discover",
            style: GoogleFonts.robotoSlab(
                fontSize: 35, fontWeight: FontWeight.w500),
          ),
        ),
        SizedBox(
          height: 10,
        ),
         CarouselSlider.builder(
                      itemCount: carousilimage
                      .length,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          margin: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                             boxShadow: [
                                BoxShadow(
                                    offset: Offset(3, 2),
                                    blurRadius:4,
                                    color: Color.fromARGB(255, 119, 117, 117))
                              ],
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: AssetImage(carousilimage[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                    ),
        InkWell(
          onTap: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Showallscreen(name:"Trending")));
          },
          child: Showallbutton(text: "Trending")),
        LimitedBox(
          maxHeight: 322,
          child: ListView.builder(
            itemCount: Trending.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
            return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(6)),
                  width: 90,
                  height: 90,
                  child: ClipRRect(
                       borderRadius: BorderRadius.circular(6),
                    child: Image.network(Trending[index],fit: BoxFit.fill,)),
                ),
              ),
              Flexible(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, top: 15),
                        child: Text(
                          Trendingname[index],
                          style:
                              GoogleFonts.robotoSlab(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        Trendingprize[index],
                        style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Addtocart1()));
                    },
                    style:
                        ElevatedButton.styleFrom(shape: RoundedRectangleBorder()
                        ,backgroundColor: Colors.black),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: Colors.black, width: 1.0))),
                      child: Text(
                        "SHOP NOW",
                        style: GoogleFonts.robotoSlab(
                          fontSize: 10,
                          color: Colors.white,
                        ),
                      ),
                    )),
              ),
            ],
          ),
        );
          }),
        )
        
       , LimitedBox(
          maxHeight: 266,
          child: ListView.builder(
              itemCount: newarrivals.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 250,
                          width: 300,
                          decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                    offset: Offset(8, 5),
                                    blurRadius: 10,
                                    color: Color.fromARGB(255, 119, 117, 117))
                              ],
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey[200]),
                          child: Stack(
                            children: [
                               ClipRRect(
                                borderRadius:BorderRadius.circular(15) ,
                                child: Image.asset(newarrivals[index],fit: BoxFit.fill,width: double.infinity,)),
                              Positioned(
                                  left: 25,
                                  top: 30,
                                  child: Text(
                                    "Collection",
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.grey),
                                  )),
                              Positioned(
                                  left: 25,
                                  top: 65,
                                  child: Text(
                                    """New Arrivals
Winter""",
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Positioned(
                                bottom: 10,
                                left: 25,
                                child: TextButton(
                                    onPressed: () {
                                      // Navigator.push(
                                      //     context,
                                      //     MaterialPageRoute(
                                      //         builder: (context) =>
                                      //             Secondcollectionpage()));
                                    },
                                    child: Row(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors.black,
                                                      width: 1.0))),
                                          child: Text(
                                            "SHOP NOW",
                                            style: GoogleFonts.robotoSlab(
                                              fontSize: 10,
                                              color: const Color.fromARGB(255, 0, 0, 0),
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.arrow_right,
                                          color: Colors.black,
                                        )
                                      ],
                                    )),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              }),
        ),
        SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: () {
              Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Showallscreen(name: "Best Selling")));
          },
          child: Showallbutton(text: "Best Selling")),
         LimitedBox(
          maxHeight: 322,
          child: ListView.builder(
            itemCount: Bestselling.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
            return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(6)),
                  width: 90,
                  height: 90,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(Bestselling[index],fit: BoxFit.fill,)),
                ),
              ),
              Flexible(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 8, top: 15),
                        child: Text(
                          Bestsellingname[index],
                          style:
                              GoogleFonts.robotoSlab(fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Text(
                        Trendingprize[index],
                        style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 55,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  height: 35,
                  width: 100,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Addtocart1()));
                      },
                      style:
                          ElevatedButton.styleFrom(shape: RoundedRectangleBorder()
                          ,backgroundColor: Colors.black),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.black, width: 1.0))),
                        child: Text(
                          "SHOP NOW",
                          style: GoogleFonts.robotoSlab(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                      )),
                ),
              ),
            ],
          ),
        );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 305,
                  width: 335,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            // offset: Offset(8, 5),
                            blurRadius: 10,
                            color: Color.fromARGB(255, 119, 117, 117))
                      ],
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey[200]),
                  child: Stack(
                    children: [
                      Image.asset("assets/zyro-images1.png",width: 200,),
                      Positioned(
                          right: 25,
                          top: 30,
                          child: Text(
                            "Black Friday",
                            style: GoogleFonts.robotoSlab(color: Colors.grey),
                          )),
                      Positioned(
                          right: 35,
                          top: 50,
                          child: Text(
                            """SALE UP TO
       70% OFF""",
                            style: GoogleFonts.robotoSlab(
                                color: Colors.black,
                                fontSize: 25,
                                fontWeight: FontWeight.w500),
                          )),
                      Positioned(
                        bottom: 30,
                        right: 25,
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Secondcollectionpage(
                                          
                                          )));
                            },
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.black,
                                              width: 1.0))),
                                  child: Text(
                                    "SHOP NOW",
                                    style: GoogleFonts.robotoSlab(
                                      fontSize: 10,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_right,
                                  color: Colors.black,
                                )
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ]),
    );
  }
}
