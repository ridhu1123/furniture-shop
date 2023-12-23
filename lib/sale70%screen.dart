import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/widget/textandshowall.dart';

class Cybermonday extends StatefulWidget {
  String? title;
  String? subtitile;
  String? images1;
  Cybermonday({super.key});
  Cybermonday.name(
      {required this.title, required this.subtitile, required this.images1});
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
                    widget.images1!,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  bottom: 152,
                  left: 26,
                  child: Text(
                    widget.subtitile!,
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
                    widget.title!,
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
            Showallbutton(text: "Chairs(5)"),
            LimitedBox(
              maxHeight: 325,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context,index){
                 return  Padding(
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
            );
              }),
            )
           , Showallbutton(text: "Lamps(5)"),
             LimitedBox(
              maxHeight: 325,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context,index){
                 return  Padding(
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
            );
              }),
            ),
            Showallbutton(text: "Tables(5)"),
              LimitedBox(
              maxHeight: 325,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context,index){
                 return  Padding(
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
            );
              }),
            )
          ],
        ),
      ),
    );
  }
}
