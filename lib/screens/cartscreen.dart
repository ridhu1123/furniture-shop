import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/screens/checkoutpage.dart';
import 'package:irohub_project/screens/homescreen.dart';
import 'package:lottie/lottie.dart';

class cartscreen extends StatefulWidget {
  final allitems;
  const cartscreen({super.key, this.allitems});

  @override
  State<cartscreen> createState() => _cartscreenState();
}

class _cartscreenState extends State<cartscreen> {
  Widget cart() {
    if (cartitems.isEmpty) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              child: Lottie.asset(
                "assets/Animation - 1705691997361.json",
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 1.3,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              "Your Shopping cart is empty !",
              style: GoogleFonts.robotoSlab(color: Colors.grey),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              """Fortnately, there's an easy solution GO...""",
              style: GoogleFonts.robotoSlab(fontWeight: FontWeight.w500),
            ),
          ),
          // SizedBox(height: 20),
          // Align(
          //   alignment: Alignment.center,
          //   child: Container(
          //     height: 40,
          //     width: 150,
          //     child: ElevatedButton(
          //       onPressed: () {
          //         Navigator.push(context,
          //             MaterialPageRoute(builder: (context) => Homescreen()));
          //       },
          //       style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          //       child: Text(
          //         "Go Shopping",
          //         style: GoogleFonts.robotoSlab(color: Colors.white),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      );
    } else {
      return Column(
        children: [
          LimitedBox(
            maxHeight: 460,
            child: ListView.separated(
                separatorBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(left: 60),
                      child: Divider(
                        thickness: 0.4,
                      ),
                    ),
                itemCount: cartitems.length,
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) {
                      setState(() {
                        cartitems.removeAt(index);
                      });
                    },
                    background: Container(
                      width: 90,
                      height: 110,
                      color: Colors.red,
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 19, bottom: 25, top: 5),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.circular(6)),
                            width: 90,
                            height: 110,
                            child: Stack(
                              children: [
                                // Image.network(
                                //   widget.allitems["image"],
                                //   fit: BoxFit.fill,
                                // ),
                                Positioned(
                                  left: 10,
                                  top: 5,
                                  child: CircleAvatar(
                                    radius: 10,
                                    backgroundColor: Colors.black,
                                    child: Text(
                                      "1",
                                      style: GoogleFonts.robotoSlab(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 8, bottom: 10),
                              child: Text(
                                "",
                                // widget.allitems["name"],
                                style: GoogleFonts.robotoSlab(
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 3),
                              child: Text(
                                "",
                                // widget.allitems["price"],
                                style:
                                    GoogleFonts.robotoSlab(color: Colors.black),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8, top: 8),
                              child: Row(
                                children: [
                                  Container(
                                    height: 10,
                                    width: 10,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Black",
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.grey[400]),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "|",
                                    style: TextStyle(color: Colors.grey[400]),
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(
                                    "Size :",
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.grey),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "38",
                                    style: GoogleFonts.robotoSlab(
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() {
                                          cartitems.removeAt(index);
                                        });
                                      },
                                      icon: Icon(
                                        Icons.delete_rounded,
                                        color: Colors.black,
                                      ))
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
          ),
          Divider(
            thickness: 0.5,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping fee",
                  style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                ),
                Text(
                  "€6.7",
                  style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                )
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shipping fee",
                  style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                ),
                Text(
                  "€6.7",
                  style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Total",
                  style: GoogleFonts.robotoSlab(
                      color: Colors.black, fontWeight: FontWeight.w500),
                ),
                Text(
                  "€6.7",
                  style: GoogleFonts.robotoSlab(
                      color: Colors.black, fontWeight: FontWeight.w500),
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          )
        ],
      );
    }
  }

  List cartitems = ["1"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      cartitems.isEmpty ? Homescreen() : Checkoutscreen()));
        },
        child: Container(
          color: Colors.black,
          height: 70,
          width: double.infinity,
          child: Center(
            child: cartitems.isEmpty
                ? Text(
                    "GO SHOPPING",
                    style: GoogleFonts.robotoSlab(color: Colors.white),
                  )
                : Text(
                    "CHECKOUT",
                    style: GoogleFonts.robotoSlab(color: Colors.white),
                  ),
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.topLeft,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.close))),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Edit",
                      style: GoogleFonts.robotoSlab(color: Colors.black),
                    ))
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Shopping cart",
                  style: GoogleFonts.robotoSlab(
                      fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Divider(
              thickness: 0.5,
            ),
            cart()
          ],
        ),
      ),
    );
  }
}
