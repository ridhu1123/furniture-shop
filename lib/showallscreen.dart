import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:irohub_project/addtocart.dart';

class Showallscreen extends StatefulWidget {
  String name;
  final items;
  Showallscreen({super.key, required this.name, this.items});

  @override
  State<Showallscreen> createState() => _ShowallscreenState();
}

class _ShowallscreenState extends State<Showallscreen> {
  var size, height, width;
  @override
  List Carousilimage = [
    "https://i.pinimg.com/564x/44/f2/d7/44f2d7ecb050d611f20e5ac54056b7c5.jpg",
    "https://i.pinimg.com/564x/e4/59/ba/e459ba1bf1de4ea4dc81acee68d8fb30.jpg",
    "https://i.pinimg.com/564x/84/05/c4/8405c4fdc6d8bac92e9aca82fe627b5d.jpg"
  ];
  // var imageurls = [];
  // void getdata() async {
  //   var storage = FirebaseStorage.instance;
  //   var ref = storage.ref().child("homescreenimages/new arrival");

  //   var imageurl = await ref.listAll();
  //   await Future.forEach(imageurl.items, (Reference reference) async {
  //     var url = await reference.getDownloadURL();
  //     setState(() {
  //       imageurls.add(url);
  //       print("hhhhhhhhhhhhhhhhhh $ref");
  //     });
  //   });
  //   print(imageurl);
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getdata();
    print("dddddddddddddddd ${widget.items}");
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.white,
            body: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: CarouselSlider.builder(
                    itemCount: 3,
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image: NetworkImage(Carousilimage[index]),
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
                ),
                SizedBox(
                  height: 30,
                ),
                LimitedBox(
                  maxHeight: height / 1.6,
                  child: GridView.builder(
                      itemCount: widget.items.length,
                      // physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisExtent: 255),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 9.0, right: 9, top: 12, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Addtocart1(
                                                proName: widget.items[index],
                                              )));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(6)),
                                  width: 160,
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(6),
                                        child: Image.network(
                                          widget.items[index]["image"],
                                          fit: BoxFit.cover,
                                          width: double.infinity,
                                          height: double.infinity,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: IconButton(
                                            color: Colors.black,
                                            onPressed: () {
                                              // Navigator.push(
                                              //     context,
                                              //     MaterialPageRoute(
                                              //         builder: (context) =>
                                              //             cartscreen(
                                              //                 allitems:
                                              //                     widget.items[
                                              //                         index])));
                                            },
                                            icon: Icon(
                                              Icons.shopping_bag,
                                              color: Color.fromARGB(
                                                  255, 241, 71, 59),
                                              size: 18,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Container(
                                    height: 18,
                                    child: Text(
                                      widget.items[index]["name"],
                                      style: GoogleFonts.robotoSlab(),
                                    ),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    widget.items[index]["price"],
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.grey[400]),
                                  ))
                            ],
                          ),
                        );
                      }),
                )
              ],
            )));
  }

  // var newarrivals = [];
  // var toptrends = [];
  // var topdeals = [];
  // var bestsellers = [];
  // var trending = [];
  // var bestselling = [];

  // Future<void> addditemtostorage() async {
  //   UserCredential userCredential =
  //       await FirebaseAuth.instance.signInAnonymously();
  //   var uid = userCredential.user!.uid;
  //   await FirebaseFirestore.instance.collection("users").doc(uid).set({
  //     "image": newarrivals,
  //   });
  // }
}
