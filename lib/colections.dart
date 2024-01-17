import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/secondcollection.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class Collections extends StatefulWidget {
  const Collections({super.key});

  @override
  State<Collections> createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  @override
  void initState() {
    // TODO: implement initState

    getdatafromthirdcollection();
  }

  var bigsale = [];
  getdatafromthirdcollection() async {
    var res = await FirebaseFirestore.instance
        .collection("collections")
        .doc("thirdcollections")
        .get();
    bigsale.addAll(res.data()?["Bigsale"]);
    print("hhhhhhhhhhhhhh ${res.data()}");
    print("3333333333333333 ${bigsale}");
  }
  // Future<void> uploadImage(String imageName) async {
  //   final Directory tempDir = await getTemporaryDirectory();
  //   final File file = await File('${tempDir.path}/$imageName').create();

  //   await file.writeAsBytes(
  //       (await rootBundle.load('assets/$imageName')).buffer.asUint8List());

  //   try {
  //     await FirebaseStorage.instance
  //         .ref('collection1 images/$imageName')
  //         .putFile(file);
  //   } on FirebaseException catch (e) {
  //     // Handle any errors
  //     print(e);
  //   }
  // }
  // Future<void> uploadtofirestore() async {
  //   await FirebaseFirestore.instance
  //       .collection("collections")
  //       .doc("allcollections")
  //       .set({
  //     "items": [
  //       {
  //         "image": images[0],
  //         "shortname": shortname[0],
  //         "names": names[0],
  //       },
  //       {
  //         "image": images[1],
  //         "shortname": shortname[1],
  //         "names": names[1],
  //       },
  //       {
  //         "image": images[2],
  //         "shortname": shortname[2],
  //         "names": names[2],
  //       },
  //     ],
  //     "nextitems": [
  //       {
  //         "image": images1[0],
  //         "shortname": shortname[0],
  //         "names": names[0],
  //       },
  //       {
  //         "image": images1[1],
  //         "shortname": shortname[1],
  //         "names": names[1],
  //       },
  //       {
  //         "image": images1[2],
  //         "shortname": shortname[2],
  //         "names": names[2],
  //       },
  //     ]
  //   });
  // }
  var collection = [];
  var collection1 = [];
  getdatasfromfirestore() async {
    var res = await FirebaseFirestore.instance
        .collection("collections")
        .doc("allcollections")
        .get();
    collection.addAll(res.data()?["items"]);
    collection1.addAll(res.data()?["nextitems"]);
  }

  @override
  Widget build(BuildContext context) {
    // for (var image in images1) {
    //   uploadImage(basename(image));
    // }
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
          FutureBuilder(
              future: getdatasfromfirestore(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  return LimitedBox(
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
                                      collection[index]["image"],
                                    )),
                                Positioned(
                                    top: 25,
                                    left: 10,
                                    child: Text(
                                      collection[index]["shortname"],
                                      style: GoogleFonts.robotoSlab(
                                          color: Colors.grey[400]),
                                    )),
                                Positioned(
                                    top: 45,
                                    left: 10,
                                    child: Text(
                                      collection[index]["names"],
                                      style: GoogleFonts.robotoSlab(
                                        fontSize: 25,
                                      ),
                                    )),
                                Positioned(
                                  bottom: 30,
                                  left: 25,
                                  child: TextButton(
                                      onPressed: () {
                                        //                              if (FirebaseAuth.instance.currentUser != null) {
                                        // // User is signed in, proceed with Firestore write operation

                                        //                          await
                                        //                       } else {
                                        // // User is not signed in, handle accordingly (e.g., prompt user to sign in)
                                        //                      print("User is not signed in");
                                        //                     }
                                        print(
                                            "coleeeeeeeeeeeeeeeeee ${collection1[index]}");
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Secondcollectionpage(
                                                      collection2:
                                                          bigsale[index],
                                                      collection1:
                                                          collection1[index],
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
                  );
                }
                return Center(
                  heightFactor: 16,
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                );
              })
        ],
      ),
    );
  }
}
