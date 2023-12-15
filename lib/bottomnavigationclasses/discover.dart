import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
  List exploreimage = [
    "https://i.pinimg.com/564x/79/91/58/799158da597625ffa054d48fecdef369.jpg",
    "https://i.pinimg.com/564x/f1/20/ba/f120ba0160225cf18a564a67e3bb22c6.jpg",
    "https://i.pinimg.com/564x/df/66/0e/df660ef6ec3351b9c8ef06606661893e.jpg"
  ];
  List discovername = ["Sofa", "Lamps", "Chair"];
  List discoveritem = ["10", "5", "6"];
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 60),
          child: Text(
            "Discover",
            style: GoogleFonts.robotoSlab(
                fontSize: 30, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        LimitedBox(
          maxHeight: 250,
          child: ListView.builder(
              itemCount: exploreimage.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 140,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(6),
                          child: Image.network(
                            exploreimage[index],
                            height: 190,
                            width: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              discovername[index],
                              style: GoogleFonts.robotoSlab(),
                            )),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "${discoveritem[index]} items",
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.grey[400]),
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
                            Showallscreen(name: "Trending")));
          },
          child: Showallbutton(text: "Trending")),
        LimitedBox(
          maxHeight: 322,
          child: ListView.builder(
            itemCount: 3,
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
                  // child: Image.network("src"),
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 15),
                      child: Text(
                        newarrivalsname[1],
                        style:
                            GoogleFonts.robotoSlab(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Text(
                    newarrivalsprize[1],
                    style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                  ),
                ],
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
              itemCount: 3,
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
                              // Image.network(""),
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
                                  top: 55,
                                  child: Text(
                                    """New Arrivals
Winter""",
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  )),
                              Positioned(
                                bottom: 30,
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
            itemCount: 3,
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
                  // child: Image.network("src"),
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8, right: 8, top: 15),
                      child: Text(
                        newarrivalsname[1],
                        style:
                            GoogleFonts.robotoSlab(fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Text(
                    newarrivalsprize[1],
                    style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                  ),
                ],
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
                      // Image.network(""),
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
