import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/itemcartedscreen1.dart';

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
  List newarrivals = [
    "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
    "assets/40446cd0-7055-4954-89fa-e2bb3c0ecb5b.jpg",
    "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
    "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
    "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
    "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
    "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
    "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
  ];
  List newarrivalsname = [
    "Nancy chair",
    "Nancy chair",
    "Nancy chair",
    "Nancy chair",
    "Nancy chair",
    "Nancy chair",
    "Nancy chair",
    "Nancy chair",
  ];
  List newarrivalsprize = [
    "€29.00",
    "€29.00",
    "€29.00",
    "€29.00",
    "€29.00",
    "€29.00",
    "€29.00",
    "€29.00",
  ];
  List slideimage = [ClassA(), ClassB(), CLassC()];
  List explorename = ["Sofa", "Lamps", "Chair"];
  List exploreitems = ["10", "5", "6"];
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
          Showall(text: "New Arrivals"),
          LimitedBox(
            maxHeight: 240,
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
                            child: Align(
                              alignment: Alignment.topRight,
                              child: Stack(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      favourite();
                                    },
                                    icon: (_isfavourite
                                        ? Icon(
                                            Icons.favorite,
                                            size: 18,
                                          )
                                        : Icon(
                                            Icons.favorite_border,
                                            size: 18,
                                          )),
                                    color: Colors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              newarrivalsname[index],
                              style: GoogleFonts.robotoSlab(),
                            )),
                        Text(
                          newarrivalsprize[index],
                          style:
                              GoogleFonts.robotoSlab(color: Colors.grey[400]),
                        )
                      ],
                    ),
                  );
                }),
          ),
          Showall(text: "Top Trends"),
          LimitedBox(
            maxHeight: 240,
            child: ListView.builder(
                itemCount: newarrivals.length,
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
                                    builder: (context) => Addtocart1()));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(6)),
                            width: 160,
                            height: 190,
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
                              newarrivalsname[index],
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
          Showall(text: "Best sellers"),
          LimitedBox(
            maxHeight: 730,
            child: ListView.separated(
                separatorBuilder: (context, index) => Divider(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: newarrivals.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Addtocart1()));
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
                            // child: Image.network("src"),
                          ),
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, right: 8, top: 8),
                                  child: Text(
                                    newarrivalsname[index],
                                    style: GoogleFonts.robotoSlab(),
                                  ),
                                ),
                              ),
                              Text(
                                newarrivalsprize[index],
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.grey[400]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       InkWell(
          //         onTap: () {},
          //         child: Container(
          //           decoration: BoxDecoration(
          //               color: Colors.grey[200],
          //               borderRadius: BorderRadius.circular(6)),
          //           width: 90,
          //           height: 90,
          //           // child: Image.network("src"),
          //         ),
          //       ),
          //       Column(
          //         children: [
          //           Align(
          //             alignment: Alignment.topLeft,
          //             child: Padding(
          //               padding:
          //                   const EdgeInsets.only(left: 8, right: 8, top: 8),
          //               child: Text(
          //                 newarrivalsname[1],
          //                 style: GoogleFonts.robotoSlab(),
          //               ),
          //             ),
          //           ),
          //           Text(
          //             newarrivalsprize[1],
          //             style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       InkWell(
          //         onTap: () {},
          //         child: Container(
          //           decoration: BoxDecoration(
          //               color: Colors.grey[200],
          //               borderRadius: BorderRadius.circular(6)),
          //           width: 90,
          //           height: 90,
          //           // child: Image.network("src"),
          //         ),
          //       ),
          //       Column(
          //         children: [
          //           Align(
          //             alignment: Alignment.topLeft,
          //             child: Padding(
          //               padding:
          //                   const EdgeInsets.only(left: 8, right: 8, top: 8),
          //               child: Text(
          //                 newarrivalsname[2],
          //                 style: GoogleFonts.robotoSlab(),
          //               ),
          //             ),
          //           ),
          //           Text(
          //             newarrivalsprize[2],
          //             style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       InkWell(
          //         onTap: () {},
          //         child: Container(
          //           decoration: BoxDecoration(
          //               color: Colors.grey[200],
          //               borderRadius: BorderRadius.circular(6)),
          //           width: 90,
          //           height: 90,
          //           // child: Image.network("src"),
          //         ),
          //       ),
          //       Column(
          //         children: [
          //           Align(
          //             alignment: Alignment.topLeft,
          //             child: Padding(
          //               padding:
          //                   const EdgeInsets.only(left: 8, right: 8, top: 8),
          //               child: Text(
          //                 newarrivalsname[3],
          //                 style: GoogleFonts.robotoSlab(),
          //               ),
          //             ),
          //           ),
          //           Text(
          //             newarrivalsprize[3],
          //             style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       InkWell(
          //         onTap: () {},
          //         child: Container(
          //           decoration: BoxDecoration(
          //               color: Colors.grey[200],
          //               borderRadius: BorderRadius.circular(6)),
          //           width: 90,
          //           height: 90,
          //           // child: Image.network("src"),
          //         ),
          //       ),
          //       Column(
          //         children: [
          //           Align(
          //             alignment: Alignment.topLeft,
          //             child: Padding(
          //               padding:
          //                   const EdgeInsets.only(left: 8, right: 8, top: 8),
          //               child: Text(
          //                 newarrivalsname[4],
          //                 style: GoogleFonts.robotoSlab(),
          //               ),
          //             ),
          //           ),
          //           Text(
          //             newarrivalsprize[4],
          //             style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       InkWell(
          //         onTap: () {},
          //         child: Container(
          //           decoration: BoxDecoration(
          //               color: Colors.grey[200],
          //               borderRadius: BorderRadius.circular(6)),
          //           width: 90,
          //           height: 90,
          //           // child: Image.network("src"),
          //         ),
          //       ),
          //       Column(
          //         children: [
          //           Align(
          //             alignment: Alignment.topLeft,
          //             child: Padding(
          //               padding:
          //                   const EdgeInsets.only(left: 8, right: 8, top: 8),
          //               child: Text(
          //                 newarrivalsname[5],
          //                 style: GoogleFonts.robotoSlab(),
          //               ),
          //             ),
          //           ),
          //           Text(
          //             newarrivalsprize[5],
          //             style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       InkWell(
          //         onTap: () {},
          //         child: Container(
          //           decoration: BoxDecoration(
          //               color: Colors.grey[200],
          //               borderRadius: BorderRadius.circular(6)),
          //           width: 90,
          //           height: 90,
          //           // child: Image.network("src"),
          //         ),
          //       ),
          //       Column(
          //         children: [
          //           Align(
          //             alignment: Alignment.topLeft,
          //             child: Padding(
          //               padding:
          //                   const EdgeInsets.only(left: 8, right: 8, top: 8),
          //               child: Text(
          //                 newarrivalsname[6],
          //                 style: GoogleFonts.robotoSlab(),
          //               ),
          //             ),
          //           ),
          //           Text(
          //             newarrivalsprize[6],
          //             style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       InkWell(
          //         onTap: () {},
          //         child: Container(
          //           decoration: BoxDecoration(
          //               color: Colors.grey[200],
          //               borderRadius: BorderRadius.circular(6)),
          //           width: 90,
          //           height: 90,
          //           // child: Image.network("src"),
          //         ),
          //       ),
          //       Column(
          //         children: [
          //           Align(
          //             alignment: Alignment.topLeft,
          //             child: Padding(
          //               padding:
          //                   const EdgeInsets.only(left: 8, right: 8, top: 8),
          //               child: Text(
          //                 newarrivalsname[7],
          //                 style: GoogleFonts.robotoSlab(),
          //               ),
          //             ),
          //           ),
          //           Text(
          //             newarrivalsprize[7],
          //             style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
          //           ),
          //         ],
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
