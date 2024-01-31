import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/constants/sharedpreference.dart';
import 'package:irohub_project/data/user/user_repository.dart';
import 'package:irohub_project/data/user/usermodel.dart';
import 'package:irohub_project/screens/checkoutpage.dart';
import 'package:irohub_project/screens/homescreen.dart';
import 'package:lottie/lottie.dart';

class cartscreen extends StatefulWidget {
  final allitems;
  final id;
  const cartscreen({super.key, this.allitems, this.id});

  @override
  State<cartscreen> createState() => _cartscreenState();
}

class _cartscreenState extends State<cartscreen> {
  final controller = Get.put(UserRepository());
  List<Map<String, dynamic>> allDocument = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getitems();
    // print("111111111111 ${widget.id}");
    getitems();
    // controller.getitems();
    // print("fuckyouuuuuuuuuuuu ${controller.allDocument}");
    // print(" hhhhhhhhhhhhhhh");
  }

  Future<List<Map<String, dynamic>>> getitems() async {
    print("hloooo");
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(shared_preferences_id)
          .collection("cartedItems")
          .get();
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> documentData = doc.data() as Map<String, dynamic>;
        allDocument.add(documentData);
        print(allDocument);
      });
    } catch (e) {
      print("vvvvvvvvvv $e");
    }
    return allDocument;
  }

  deleteDataFromFirestore() async {
    try {
      var collection = FirebaseFirestore.instance.collection('users');
      var snapshot = await collection
          .doc(shared_preferences_id)
          .collection("cartedItems")
          .get();
      for (var doc in snapshot.docs) {
        await doc.reference.collection("cartedItems").doc().delete();
      }
    } catch (e) {
      print("contains error $e");
    }
  }
  // Widget cart() {
  //   if (cartitems.isEmpty) {
  //     return Column(
  //       children: [
  //         Padding(
  //           padding: const EdgeInsets.only(top: 30),
  //           child: Container(
  //             child: Lottie.asset(
  //               "assets/Animation - 1705691997361.json",
  //               height: MediaQuery.of(context).size.height * 0.4,
  //               width: MediaQuery.of(context).size.width * 1.3,
  //             ),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 25,
  //         ),
  //         Align(
  //           alignment: Alignment.center,
  //           child: Text(
  //             "Your Shopping cart is empty !",
  //             style: GoogleFonts.robotoSlab(color: Colors.grey),
  //           ),
  //         ),
  //         SizedBox(
  //           height: 15,
  //         ),
  //         Align(
  //           alignment: Alignment.center,
  //           child: Text(
  //             """Fortnately, there's an easy solution GO...""",
  //             style: GoogleFonts.robotoSlab(fontWeight: FontWeight.w500),
  //           ),
  //         ),
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
  //     ],
  //   );
  // } else {
  // return Column(
  //   children: [
  //     LimitedBox(
  //       maxHeight: 460,
  //       child: ListView.separated(
  //           separatorBuilder: (context, index) => Padding(
  //                 padding: const EdgeInsets.only(left: 60),
  //                 child: Divider(
  //                   thickness: 0.4,
  //                 ),
  //               ),
  //           itemCount: controller.allDocument.length,
  //           itemBuilder: (context, index) {
  //             return Dismissible(
  //               key: UniqueKey(),
  //               direction: DismissDirection.endToStart,
  //               onDismissed: (direction) {
  //                 setState(() {
  //                   cartitems.removeAt(index);
  //                 });
  //               },
  //               background: Container(
  //                 width: 90,
  //                 height: 110,
  //                 color: Colors.red,
  //               ),
  //               child: Row(
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.only(
  //                         left: 19, bottom: 25, top: 5),
  //                     child: Container(
  //                       decoration: BoxDecoration(
  //                           color: Colors.grey[200],
  //                           borderRadius: BorderRadius.circular(6)),
  //                       width: 90,
  //                       height: 110,
  //                       child: Stack(
  //                         children: [
  //                           Image.network(
  //                             controller.allDocument[index]["image"],
  //                             fit: BoxFit.fill,
  //                           ),
  //                           Positioned(
  //                             left: 10,
  //                             top: 5,
  //                             child: CircleAvatar(
  //                               radius: 10,
  //                               backgroundColor: Colors.black,
  //                               child: Text(
  //                                 "1",
  //                                 style: GoogleFonts.robotoSlab(
  //                                     fontSize: 10, color: Colors.white),
  //                               ),
  //                             ),
  //                           )
  //                         ],
  //                       ),
  //                     ),
  //                   ),
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Padding(
  //                         padding:
  //                             const EdgeInsets.only(left: 8, bottom: 10),
  //                         child: Text(
  //                           "",
  //                           // controller.allDocument[index]["name"],
  //                           style: GoogleFonts.robotoSlab(
  //                               fontWeight: FontWeight.w500),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 8, top: 3),
  //                         child: Text(
  //                           "",
  //                           // controller.allDocument[index]["price"],
  //                           style:
  //                               GoogleFonts.robotoSlab(color: Colors.black),
  //                         ),
  //                       ),
  //                       Padding(
  //                         padding: const EdgeInsets.only(left: 8, top: 8),
  //                         child: Row(
  //                           children: [
  //                             Container(
  //                               height: 10,
  //                               width: 10,
  //                               decoration: BoxDecoration(
  //                                   borderRadius: BorderRadius.circular(20),
  //                                   color: Colors.black),
  //                             ),
  //                             SizedBox(
  //                               width: 5,
  //                             ),
  //                             Text(
  //                               "Black",
  //                               style: GoogleFonts.robotoSlab(
  //                                   color: Colors.grey[400]),
  //                             ),
  //                             SizedBox(
  //                               width: 8,
  //                             ),
  //                             Text(
  //                               "|",
  //                               style: TextStyle(color: Colors.grey[400]),
  //                             ),
  //                             SizedBox(
  //                               width: 8,
  //                             ),
  //                             Text(
  //                               "Size :",
  //                               style: GoogleFonts.robotoSlab(
  //                                   color: Colors.grey),
  //                             ),
  //                             SizedBox(
  //                               width: 5,
  //                             ),
  //                             Text(
  //                               "38",
  //                               style: GoogleFonts.robotoSlab(
  //                                   color: Colors.black),
  //                             ),
  //                             SizedBox(
  //                               width: 30,
  //                             ),
  //                             IconButton(
  //                                 onPressed: () {
  //                                   setState(() {
  //                                     cartitems.removeAt(index);
  //                                   });
  //                                 },
  //                                 icon: Icon(
  //                                   Icons.delete_rounded,
  //                                   color: Colors.black,
  //                                 ))
  //                           ],
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             );
  //           }),
  //     ),
  //     Divider(
  //       thickness: 0.5,
  //     ),
  //     Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             "Shipping fee",
  //             style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
  //           ),
  //           Text(
  //             "€6.7",
  //             style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
  //           )
  //         ],
  //       ),
  //     ),
  //     Padding(
  //       padding:
  //           const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 5),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             "Shipping fee",
  //             style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
  //           ),
  //           Text(
  //             "€6.7",
  //             style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
  //           )
  //         ],
  //       ),
  //     ),
  //     Padding(
  //       padding: const EdgeInsets.all(8.0),
  //       child: Row(
  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //         children: [
  //           Text(
  //             "Total",
  //             style: GoogleFonts.robotoSlab(
  //                 color: Colors.black, fontWeight: FontWeight.w500),
  //           ),
  //           Text(
  //             "€6.7",
  //             style: GoogleFonts.robotoSlab(
  //                 color: Colors.black, fontWeight: FontWeight.w500),
  //           )
  //         ],
  //       ),
  //     ),
  //     SizedBox(
  //       height: 15,
  //     )
  //   ],
  // );
  // }

  List cartitems = ["1"];
  final UserModel user = UserModel();
  @override
  Widget build(BuildContext context) {
    final controller1 = UserRepository.instance;
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
          child: Column(children: [
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

            // Column(
            //         children: [
            //           Padding(
            //             padding: const EdgeInsets.only(top: 30),
            //             child: Container(
            //               child: Lottie.asset(
            //                 "assets/Animation - 1705691997361.json",
            //                 height: MediaQuery.of(context).size.height * 0.4,
            //                 width: MediaQuery.of(context).size.width * 1.3,
            //               ),
            //             ),
            //           ),
            //           SizedBox(
            //             height: 25,
            //           ),
            //           Align(
            //             alignment: Alignment.center,
            //             child: Text(
            //               "Your Shopping cart is empty !",
            //               style: GoogleFonts.robotoSlab(color: Colors.grey),
            //             ),
            //           ),
            //           SizedBox(
            //             height: 15,
            //           ),
            //           Align(
            //             alignment: Alignment.center,
            //             child: Text(
            //               """Fortnately, there's an easy solution GO...""",
            //               style: GoogleFonts.robotoSlab(
            //                   fontWeight: FontWeight.w500),
            //             ),
            //           ),
            //           // SizedBox(height: 20),
            //           // Align(
            //           //   alignment: Alignment.center,
            //           //   child: Container(
            //           //     height: 40,
            //           //     width: 150,
            //           //     child: ElevatedButton(
            //           //       onPressed: () {
            //           //         Navigator.push(context,
            //           //             MaterialPageRoute(builder: (context) => Homescreen()));
            //           //       },
            //           //       style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            //           //       child: Text(
            //           //         "Go Shopping",
            //           //         style: GoogleFonts.robotoSlab(color: Colors.white),
            //           //       ),
            //           //     ),
            //           //   ),
            //           // ),
            //         ],
            //       )
            //     :
            FutureBuilder(
                future: controller.getitems(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (allDocument.isEmpty) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Container(
                              child: Lottie.asset(
                                "assets/Animation - 1705691997361.json",
                                height:
                                    MediaQuery.of(context).size.height * 0.4,
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
                              style: GoogleFonts.robotoSlab(
                                  fontWeight: FontWeight.w500),
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
                                itemCount: allDocument.length,
                                itemBuilder: (context, index) {
                                  return Dismissible(
                                    key: UniqueKey(),
                                    direction: DismissDirection.endToStart,
                                    onDismissed: (direction) {
                                      setState(() {
                                        allDocument.removeAt(index);
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
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                            width: 90,
                                            height: 110,
                                            child: Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                  child: Image.network(
                                                    allDocument[index]["image"],
                                                    fit: BoxFit.fill,
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                  ),
                                                ),
                                                // Positioned(
                                                //   left: 10,
                                                //   top: 5,
                                                //   child: CircleAvatar(
                                                //     radius: 10,
                                                //     backgroundColor: Colors.black,
                                                //     child: Text(
                                                //       "1",
                                                //       style: GoogleFonts.robotoSlab(
                                                //           fontSize: 10,
                                                //           color: Colors.white),
                                                //     ),
                                                //   ),
                                                // )
                                              ],
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, bottom: 10),
                                              child: Text(
                                                allDocument[index]
                                                    ["productname"],
                                                // controller.allDocument[index]["name"],
                                                style: GoogleFonts.robotoSlab(
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, top: 3),
                                              child: Text(
                                                allDocument[index]["price"],
                                                // controller.allDocument[index]["price"],
                                                style: GoogleFonts.robotoSlab(
                                                    color: Colors.black),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8, top: 8),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    height: 10,
                                                    width: 10,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        color: Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "Black",
                                                    style:
                                                        GoogleFonts.robotoSlab(
                                                            color: Colors
                                                                .grey[400]),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    "|",
                                                    style: TextStyle(
                                                        color:
                                                            Colors.grey[400]),
                                                  ),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    "Size :",
                                                    style:
                                                        GoogleFonts.robotoSlab(
                                                            color: Colors.grey),
                                                  ),
                                                  SizedBox(
                                                    width: 5,
                                                  ),
                                                  Text(
                                                    "38",
                                                    style:
                                                        GoogleFonts.robotoSlab(
                                                            color:
                                                                Colors.black),
                                                  ),
                                                  SizedBox(
                                                    width: 30,
                                                  ),
                                                  IconButton(
                                                      onPressed: () {
                                                        setState(() {
                                                          deleteDataFromFirestore();
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
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.grey[400]),
                                ),
                                Text(
                                  "€6.7",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.grey[400]),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 8, left: 8, right: 8, bottom: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Shipping fee",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.grey[400]),
                                ),
                                Text(
                                  "€6.7",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.grey[400]),
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
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  "€6.7",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500),
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
                  return Center(
                    heightFactor: 16,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                }),
          ]),
        ));
  }
}
