import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/widget/textandshowall.dart';

class Cybermonday extends StatefulWidget {
  const Cybermonday({super.key});

  @override
  State<Cybermonday> createState() => _CybermondayState();
}

class _CybermondayState extends State<Cybermonday> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: 550,
              color: Colors.grey[200],
              width: double.infinity,
              child: Stack(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close)),
                ),
                Positioned(
                  top: 50,
                  left: 5,
                  right: 5,
                  child: Image.asset(
                    "assets/[removal.ai]_5203868e-b78f-4659-a105-c2647c1cc614-7043761_861-1.png",
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 152,
                  left: 26,
                  child: Text(
                    "Cyber Monday",
                    style: GoogleFonts.robotoSlab(
                        color: Colors.grey[500],
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  left: 25,
                  child: Text(
                    """Sale Up To
70% Off""",
                    style: GoogleFonts.robotoSlab(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  left: 25,
                  child: TextButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.black, width: 1.0))),
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
              ]),
            ),
            Showall(text: "Chairs(10)"),
            Padding(
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
                              const EdgeInsets.only(left: 8, right: 8, top: 8),
                          child: Text(
                            "Nancy chair",
                            style: GoogleFonts.robotoSlab(),
                          ),
                        ),
                      ),
                      Text(
                        " €29.00",
                        style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
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
                              const EdgeInsets.only(left: 8, right: 8, top: 8),
                          child: Text(
                            "Nancy chair",
                            style: GoogleFonts.robotoSlab(),
                          ),
                        ),
                      ),
                      Text(
                        " €29.00",
                        style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
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
                              const EdgeInsets.only(left: 8, right: 8, top: 8),
                          child: Text(
                            "Nancy chair",
                            style: GoogleFonts.robotoSlab(),
                          ),
                        ),
                      ),
                      Text(
                        " €29.00",
                        style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Showall(text: "Lamps(10)"),
            Padding(
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
                              const EdgeInsets.only(left: 8, right: 8, top: 8),
                          child: Text(
                            "Nancy chair",
                            style: GoogleFonts.robotoSlab(),
                          ),
                        ),
                      ),
                      Text(
                        " €29.00",
                        style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
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
                              const EdgeInsets.only(left: 8, right: 8, top: 8),
                          child: Text(
                            "Nancy chair",
                            style: GoogleFonts.robotoSlab(),
                          ),
                        ),
                      ),
                      Text(
                        " €29.00",
                        style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
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
                              const EdgeInsets.only(left: 8, right: 8, top: 8),
                          child: Text(
                            "Nancy chair",
                            style: GoogleFonts.robotoSlab(),
                          ),
                        ),
                      ),
                      Text(
                        "€29.00",
                        style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Showall(text: "Tables(20)"),
            Padding(
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
                              const EdgeInsets.only(left: 8, right: 8, top: 8),
                          child: Text(
                            "Nancy chair",
                            style: GoogleFonts.robotoSlab(),
                          ),
                        ),
                      ),
                      Text(
                        " €29.00",
                        style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
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
                              const EdgeInsets.only(left: 8, right: 8, top: 8),
                          child: Text(
                            "Nancy chair",
                            style: GoogleFonts.robotoSlab(),
                          ),
                        ),
                      ),
                      Text(
                        " €29.00",
                        style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
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
                              const EdgeInsets.only(left: 8, right: 8, top: 8),
                          child: Text(
                            "Nancy chair",
                            style: GoogleFonts.robotoSlab(),
                          ),
                        ),
                      ),
                      Text(
                        "€29.00",
                        style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
