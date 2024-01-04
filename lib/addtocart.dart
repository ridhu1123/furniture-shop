import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:five_pointed_star/five_pointed_star.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Addtocart1 extends StatefulWidget {
  final newarrivals;
  final proName;
  final trending;
  final toptrends;
  final topdeals;
  final bestselling;
  final bestsellers;
  const Addtocart1(
      {super.key,
      this.newarrivals,
      this.trending,
      this.proName,
      this.toptrends,
      this.topdeals,
      this.bestselling,
      this.bestsellers});

  @override
  State<Addtocart1> createState() => _Addtocart1State();
}

class _Addtocart1State extends State<Addtocart1> {
  List description = ["Sku", "Categories", "Tags", "Dimension"];
  List description1 = [
    "545",
    "Furiniture,Accesories",
    "#furniture,#tables",
    "185 x 40 x 62 x cm (L x W x H)"
  ];
  List<Color> colors = [
    Colors.black,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.green,
    Colors.grey
  ];

  bool onclick = false;
  int itemcount = 0;
  int itemcount1 = 0;

  getAllData() async {
    print('''dfdfdfdfdfdfdfdfdf''');
    var res = await FirebaseFirestore.instance
        .collection("products")
        .doc("new")
        .collection(widget.proName)
        .doc("details")
        .get();
    print(res.data());
    print('--------------------------------');
  }

  @override
  void initState() {
    getAllData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // var templist=[];
    // if(){

    // }
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              iconTheme: IconThemeData(color: Colors.black),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.black,
                    )),
              ],
              title: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  "Tables",
                  style:
                      GoogleFonts.robotoSlab(color: Colors.black, fontSize: 20),
                ),
              ),
              backgroundColor: Colors.grey[200],
              snap: false,
              pinned: false,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                  // background: BabylonJSViewer(
                  //   src: "assets/Untitled.glb",
                  // ),
                  ),
              expandedHeight: 600,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 12, top: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.proName}",
                        style: GoogleFonts.robotoSlab(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "\$1499.00",
                            style: GoogleFonts.robotoSlab(
                                color: Colors.red, fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: FivePointedStar(
                              selectedColor: Color.fromARGB(255, 242, 159, 15),
                              onChange: (count) {
                                setState(() {
                                  itemcount = count;
                                });
                              },
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Colors",
                        style: GoogleFonts.robotoSlab(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 400,
                        height: 50,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: colors.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: EdgeInsets.all(8),
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      // selectedindex = index;
                                    });
                                  },
                                  child: CircleAvatar(
                                    radius: 22,
                                    backgroundColor: colors[index],
                                  ),
                                ),
                              );
                            }),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "You may also like",
                            style: GoogleFonts.robotoSlab(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                          TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                  foregroundColor: Colors.black),
                              child: Row(
                                children: [
                                  Text(
                                    "Show all",
                                    style: GoogleFonts.robotoSlab(fontSize: 12),
                                  ),
                                  Icon(Icons.arrow_right)
                                ],
                              ))
                        ],
                      ),
                      LimitedBox(
                        maxHeight: 190,
                        child: ListView.builder(
                          itemCount: colors.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 8, left: 8, right: 8),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Addtocart1()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        width: 130,
                                        height: 150,
                                      ),
                                    ),
                                  ]),
                            );
                          },
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Description",
                        style: GoogleFonts.robotoSlab(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5, top: 8),
                        child: Text(
                            "I've always been eager to learn different languages, I was born and raised in a country where there's a great diversity in minority languages, Apart from my mother tongue and our country's national language which I can both speak fluently, I can speak English as well with great confidence."),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LimitedBox(
                        maxHeight: 100,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Text(
                                  "${description[index]} :",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.grey[400]),
                                ),
                                SizedBox(
                                  width: 80,
                                ),
                                Text(
                                  description1[index],
                                  style: GoogleFonts.robotoSlab(),
                                )
                              ],
                            );
                          },
                        ),
                      ),
                      Divider(
                        thickness: 1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          height: 223,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: Text(
                                  "Reviews",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                trailing: TextButton(
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          "125",
                                          style: GoogleFonts.robotoSlab(
                                              color: Colors.black),
                                        ),
                                        Text(
                                          " reviews",
                                          style: GoogleFonts.robotoSlab(
                                              color: Colors.black),
                                        ),
                                        Icon(
                                          Icons.arrow_right,
                                          color: Colors.black,
                                        )
                                      ],
                                    )),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(left: 9, top: 0),
                                    child: Container(
                                      height: 80,
                                      width: 80,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: Colors.blue),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "4.8",
                                            style: GoogleFonts.robotoSlab(
                                                fontSize: 22,
                                                color: Colors.white),
                                          ),
                                          Text(
                                            "Out of 5",
                                            style: GoogleFonts.robotoSlab(
                                                color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      chartRow(context, "  Excelent", 80),
                                      chartRow(context, "Very good", 60),
                                      chartRow(context, "    Average", 40),
                                      chartRow(context, "           Poor", 20),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              FivePointedStar(
                                selectedColor:
                                    Color.fromARGB(255, 242, 159, 15),
                                // size: Size.fromWidth(50),
                                onChange: (count) {
                                  itemcount = count;
                                },
                              ),
                              SizedBox(
                                height: 6,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Add a comment",
                                    style: GoogleFonts.robotoSlab(
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Similar Items",
                        style: GoogleFonts.robotoSlab(
                            fontSize: 15, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LimitedBox(
                        maxHeight: 242,
                        maxWidth: 300,
                        child: ListView.builder(
                            itemCount: 4,
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
                                                builder: (context) =>
                                                    Addtocart1()));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.grey[200],
                                            borderRadius:
                                                BorderRadius.circular(6)),
                                        width: 160,
                                        height: 190,
                                        child: const Align(
                                          alignment: Alignment.topRight,
                                        ),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          " widget.newarrivals[index]",
                                          style: GoogleFonts.robotoSlab(),
                                        )),
                                    Text(
                                      " widget.newarrivals[index]",
                                      style: GoogleFonts.robotoSlab(
                                          color: Colors.grey[400]),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                    ],
                  ),
                );
              }, childCount: 1),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 9, right: 9, bottom: 10),
        child: Container(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
              onPressed: () {
                setState(() {
                  onclick = true;
                });
                // if (onclick = true) {
                //   Navigator.push(context,
                //       MaterialPageRoute(builder: (context) => cartscreen()));
                // }
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Colors.black),
              child: Text(
                onclick == true ? "GO TO CART" : "ADD TO CART",
                style: GoogleFonts.robotoSlab(color: Colors.white),
              )),
        ),
      ),
    );
  }

  Widget chartRow(BuildContext context, String label, int pct) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 8),
      child: Row(
        children: [
          Text(label, style: GoogleFonts.robotoSlab(color: Colors.grey[500])),
          SizedBox(width: 8),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(15, 0, 10, 0),
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.34,
                height: 8,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(20)),
                child: Text(''),
              ),
              Container(
                width: MediaQuery.of(context).size.width * (pct / 100) * 0.34,
                height: 8,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: Text(''),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
