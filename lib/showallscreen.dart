import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/Filterscreen.dart';

class Showallscreen extends StatefulWidget {
  String name;
  Showallscreen({super.key, required this.name});

  @override
  State<Showallscreen> createState() => _ShowallscreenState();
}

class _ShowallscreenState extends State<Showallscreen> {
  @override
 

  List Carousilimage = [
    "https://i.pinimg.com/564x/44/f2/d7/44f2d7ecb050d611f20e5ac54056b7c5.jpg",
    "https://i.pinimg.com/564x/e4/59/ba/e459ba1bf1de4ea4dc81acee68d8fb30.jpg",
    "https://i.pinimg.com/564x/84/05/c4/8405c4fdc6d8bac92e9aca82fe627b5d.jpg"
  ];
  var imageurls=[];
void getdata()async{
 var storage = FirebaseStorage.instance;
 var ref=storage.ref().child("homescreenimages/new arrival");
     

 var imageurl=await ref.listAll();
 await Future.forEach(imageurl.items, (Reference reference) async{
  var url=await reference.getDownloadURL();
setState(() {
   imageurls.add(url);
 print("hhhhhhhhhhhhhhhhhh $ref");
 });
 });
 print(imageurl);
}
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                actions: [
                   TextButton(
                                 onPressed: () {
                                   Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Filterscreen()));
                                 },
                                 child: Row(mainAxisSize: MainAxisSize.min,
                                   children: [
                                     Text(
                                       "Filters",
                                       style: GoogleFonts.robotoSlab(color: Colors.grey[600],fontWeight: FontWeight.w500),
                                     ),
                                     Icon(Icons.filter_alt_sharp,size: 15,color: Colors.grey[600],)
                                   ],
                                 )),
                   
                ],
                // floating: true,
                elevation: 0,
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                title: Text(
                  widget.name,
                  style: GoogleFonts.robotoSlab(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ),
                expandedHeight: 260,
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
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
                ),
              ),
              SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                return LimitedBox(
                  maxHeight: 500,
                  child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, mainAxisExtent: 260),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 9.0, right: 9, top: 12, bottom: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(6)),
                                  width: 160,
                                  height: 200,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                            color: Colors.black,
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.favorite_border,
                                              size: 18,
                                            )),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "newarrivalsname[index]",
                                    style: GoogleFonts.robotoSlab(),
                                  )),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    "29",
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.grey[400]),
                                  ))
                            ],
                          ),
                        );
                      }),
                );
              }, childCount: 3))
            ],
          )
          // Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       // Padding(
          //       //   padding: const EdgeInsets.only(top: 20, left: 25),
          //       //   child: Text(
          //       //     "Best sellers",
          //       //     style: GoogleFonts.robotoSlab(
          //       //         fontSize: 30, fontWeight: FontWeight.w500),
          //       //   ),
          //       // ),
          //       Padding(
          //         padding: const EdgeInsets.only(top: 13),
          //         child: CarouselSlider.builder(
          //           itemCount: 3,
          //           itemBuilder: (context, index, realIndex) {
          //             return Container(
          //               margin: EdgeInsets.all(6),
          //               decoration: BoxDecoration(
          //                 borderRadius: BorderRadius.circular(8.0),
          //                 image: DecorationImage(
          //                   image: NetworkImage(Carousilimage[index]),
          //                   fit: BoxFit.cover,
          //                 ),
          //               ),
          //             );
          //           },
          //           options: CarouselOptions(
          //             height: 180.0,
          //             enlargeCenterPage: true,
          //             autoPlay: true,
          //             aspectRatio: 16 / 9,
          //             autoPlayCurve: Curves.fastOutSlowIn,
          //             enableInfiniteScroll: true,
          //             autoPlayAnimationDuration: Duration(milliseconds: 800),
          //             viewportFraction: 0.8,
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding: const EdgeInsets.only(top: 20),
          //         child: LimitedBox(
          //           maxHeight: 500,
          //           child: GridView.builder(
          //               itemCount: 10,
          //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          //                   crossAxisCount: 2, mainAxisExtent: 260),
          //               itemBuilder: (context, index) {
          //                 return Padding(
          //                   padding: const EdgeInsets.only(
          //                       left: 9.0, right: 9, top: 12, bottom: 5),
          //                   child: Column(
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: [
          //                       InkWell(
          //                         onTap: () {},
          //                         child: Container(
          //                           decoration: BoxDecoration(
          //                               color: Colors.grey[200],
          //                               borderRadius: BorderRadius.circular(6)),
          //                           width: 160,
          //                           height: 200,
          //                           child: Stack(
          //                             children: [
          //                               Align(
          //                                 alignment: Alignment.topRight,
          //                                 child: IconButton(
          //                                     color: Colors.black,
          //                                     onPressed: () {},
          //                                     icon: Icon(
          //                                       Icons.favorite_border,
          //                                       size: 18,
          //                                     )),
          //                               )
          //                             ],
          //                           ),
          //                         ),
          //                       ),
          //                       Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "newarrivalsname[index]",
          //                             style: GoogleFonts.robotoSlab(),
          //                           )),
          //                       Align(
          //                           alignment: Alignment.topLeft,
          //                           child: Text(
          //                             "29",
          //                             style: GoogleFonts.robotoSlab(
          //                                 color: Colors.grey[400]),
          //                           ))
          //                     ],
          //                   ),
          //                 );
          //               }),
          //         ),
          //       ),
          //     ],
          //   ),
          ),
    );
  }
}
