import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:irohub_project/screens/colections.dart';
import 'package:irohub_project/screens/thirdcollection.dart';

class Secondcollectionpage extends StatefulWidget {
  final collection1;
  final collection2;
  Secondcollectionpage(
      {super.key, required this.collection1, required this.collection2});

  @override
  State<Secondcollectionpage> createState() => _SecondcollectionpageState();
}

class _SecondcollectionpageState extends State<Secondcollectionpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("sssssssssss ${widget.collection2}");
    // getdatafromfirestore();
    // copyAndPasteData();
    // copyDocument();
    // users=FirebaseFirestore.instance.collection("user");
    // print("aaaaaaaaaaaaaaaaaaaaaa ${users}");
  }

//    late CollectionReference users;
// Future<List<QueryDocumentSnapshot>> fetchdata()async{
//   QuerySnapshot querySnapshot=await users.get();
//   return querySnapshot.docs;
// }
  // var bigsale = [];
  // getdatafromfirestore() async {
  //   var res = await FirebaseFirestore.instance
  //       .collection("collections")
  //       .doc("thirdcollections")
  //       .get();
  //   bigsale.add(res.data());
  //   print("hhhhhhhhhhhhhh ${res.data()}");
  // }

  // void copyAndPasteData() {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;

  //   // Document reference for your collection
  //   DocumentReference documentRef =
  //       firestore.collection('collections').doc('thirdcollections');

  //   // Read data from the document
  //   documentRef.get().then((value) {
  //     if (value.exists) {
  //       Map<String, dynamic>? data = value.data() as Map<String, dynamic>?;
  //       if (data != null) {
  //         List<dynamic> bigSaleList = data['Bigsale'];
  //         print("lllllll ${bigSaleList}");
  //         // Ensure there are at least two elements in the list
  //         if (bigSaleList.length >= 2) {
  //           // Copy data from [0] index
  //           Map<String, dynamic>? dataToCopy = bigSaleList[0];

  //           // Paste data into [1] index
  //           bigSaleList[2] = dataToCopy;

  //           // Update the document with the modified data
  //           documentRef.update({'Bigsale': bigSaleList}).then((_) {
  //             print('Data copied and pasted successfully.');
  //           }).catchError((error) {
  //             print('Error updating document: $error');
  //           });
  //         } else {
  //           print(
  //               'Not enough elements in the "Bigsale" list to perform copy and paste.');
  //         }
  //       } else {
  //         print('Document data is null.');
  //       }
  //     } else {
  //       print('Document does not exist.');
  //     }
  //   }).catchError((error) {
  //     print('Error getting document: $error');
  //   });
  // }

  // void copyDocument() {
  //   DocumentReference copyFrom = FirebaseFirestore.instance
  //       .collection('collections')
  //       .doc('thirdcollections');
  //   DocumentReference copyTo =
  //       FirebaseFirestore.instance.collection('collections2').doc('allitems');

  //   copyFrom.get().then((value) {
  //     if (value.exists) {
  //       copyTo.set(
  //           value.data()!); // Use the non-nullable assertion operator (!) here
  //     } else {
  //       print('Document does not exist in copyFrom collection.');
  //     }
  //   }).catchError((error) {
  //     print('Error getting document: $error');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // print("333333333333333333333 ${widget.collection1["image"]}");
    return Scaffold(
        body: ListView(children: [
      Align(
          alignment: Alignment.topLeft,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back))),
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          "Collection",
          style: GoogleFonts.robotoSlab(fontSize: 30),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(14.0),
        child: Container(
          height: 506,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                offset: Offset(8, 9),
                blurRadius: 10,
                color: Color.fromARGB(255, 119, 117, 117))
          ], borderRadius: BorderRadius.circular(15), color: Colors.grey[200]),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  widget.collection1["image"],
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.collection1["shortname"],
                    style: GoogleFonts.robotoSlab(
                        color: Colors.grey[500],
                        fontSize: 12,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.collection1["names"],
                    style: GoogleFonts.robotoSlab(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 8),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                      onPressed: () {
                        // getdatafromfirestore() async {
                        //   print("aaaaaaaaaaaaaaaaa");
                        //   var res = await FirebaseFirestore.instance
                        //       .collection("collections")
                        //       .doc("thirdcollections")
                        //       .get();
                        //   print("hiiiiiiiiiiiii ${res.data()}");
                        // }
                        // print("ddddddddddddddddddddddd ${widget.collection1}");
                        print("aaaaaaaaaaaaaaa ${widget.collection2}");
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => thirdcollection(
                                      collection2: widget.collection2,
                                      collection1: widget.collection1,
                                    )));
                      },
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
                ),
              )
            ],
          ),
        ),
      )
    ]));
  }
}

// Padding(
//   padding: const EdgeInsets.all(14.0),
//   child: Container(
//     height: 506,
//     decoration: BoxDecoration(
//         boxShadow: [
//           BoxShadow(
//               offset: Offset(8, 9),
//               blurRadius: 10,
//               color: Color.fromARGB(255, 119, 117, 117))
//         ],
//         borderRadius: BorderRadius.circular(15),
//         color: Colors.grey[200]),
//     child: Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Image.asset(
//             "",
//             fit: BoxFit.fill,
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 10),
//           child: Align(
//             alignment: Alignment.bottomLeft,
//             child: Text(
//               "",
//               style: GoogleFonts.robotoSlab(
//                   color: Colors.grey[500],
//                   fontSize: 12,
//                   fontWeight: FontWeight.w400),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 10),
//           child: Align(
//             alignment: Alignment.bottomLeft,
//             child: Text(
//              "",
//               style: GoogleFonts.robotoSlab(
//                   color: Colors.black,
//                   fontSize: 30,
//                   fontWeight: FontWeight.w500),
//             ),
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 10, top: 8),
//           child: Align(
//             alignment: Alignment.bottomLeft,
//             child: TextButton(
//                 onPressed: () {
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) => Cybermonday.name(title:widget.title,subtitile: widget.subtitle,images1: widget.images1,)));
//                 },
//                 child: Row(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                           border: Border(
//                               bottom: BorderSide(
//                                   color: Colors.black, width: 1.0))),
//                       child: Text(
//                         "SHOP NOW",
//                         style: GoogleFonts.robotoSlab(
//                           fontSize: 10,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                     Icon(
//                       Icons.arrow_right,
//                       color: Colors.black,
//                     )
//                   ],
//                 )),
//           ),
//         )
//       ],
//     ),
//   ),
// )
