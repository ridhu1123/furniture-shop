import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/collection1page.dart';

class Collections extends StatefulWidget {
  const Collections({super.key});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  List images1 = [
    "assets/[removal.ai]_5203868e-b78f-4659-a105-c2647c1cc614-7043761_861-1.png",
    "assets/[removal.ai]_7b6353a1-14a6-4138-98bf-b2e9552230d1-primitive--simple--dolmena-chair-by-russian-manufacturer-polli-_-oen-1.png",
    "assets/[removal.ai]_5ca82d1a-9eb1-479f-a6e8-8fd2665afd0c-7043766_866.png"
  ];

  List images = [
    "assets/[removal.ai]_a0492e82-9141-4c26-91c0-f1cc881945f3-light-lamp1.png",
    "assets/zyro-image (5).png",
    "assets/[removal.ai]_33655040-e27e-4330-aa79-6c6eb56b0649-04d5a5dc11dea0cedb32dcee45b7a884.png"
  ];
  List shortname = ["Black friday", "New Arrivals", "Cyber Monday"];
  List names = [
    """New Arrivals
Winder""",
    """Big Sale
50% Off""",
    """Sale Up To 
70% Off"""
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.shopify_outlined, color: Colors.black),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(9.0),
            child: Text(
              "Collection",
              style: GoogleFonts.robotoSlab(fontSize: 30),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          LimitedBox(
            maxHeight: 630,
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            offset: Offset(4, 6),
                            blurRadius: 3,
                            color: Color.fromARGB(255, 213, 211, 211))
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[200],
                    ),
                    height: 200,
                    child: Stack(
                      children: [
                        Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              images[index],
                            )),
                        Positioned(
                            top: 25,
                            left: 10,
                            child: Text(
                              shortname[index],
                              style: GoogleFonts.robotoSlab(
                                  color: Colors.grey[400]),
                            )),
                        Positioned(
                            top: 45,
                            left: 10,
                            child: Text(
                              names[index],
                              style: GoogleFonts.robotoSlab(
                                fontSize: 25,
                              ),
                            )),
                        Positioned(
                          bottom: 30,
                          left: 25,
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Secondcollectionpage.name(
                                              title: names[index],
                                              subtitle: shortname[index],
                                              images1: images1[index],
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
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
