import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/Filterscreen.dart';

class Sofascreen extends StatefulWidget {
  final exploreimage;
  final explorename;
  final exploreprice;
  const Sofascreen(
      {super.key, this.exploreimage, this.explorename, this.exploreprice});

  @override
  State<Sofascreen> createState() => _SofascreenState();
}

class _SofascreenState extends State<Sofascreen> {
  List Sofanames = [
    "Mid-Century Sofas",
    "Chesterfield Sofas",
    "Loveseat Sofas",
    "Sleeper Sofas",
    "Relax Sofas",
    "Chaise Lounge"
  ];
  List Lampname = [""];
  //   List Lampimages = [
  //   "https://i.pinimg.com/564x/5a/d4/51/5ad451c14ea927c13e7ac1f818436bbd.jpg",
  //   "https://i.pinimg.com/564x/b1/41/7d/b1417dd1a9ce1d7c07cd4e9aaf966d9c.jpg",
  //   "https://i.pinimg.com/564x/e6/f7/99/e6f799978e7ff31e8fd301fa8525b812.jpg",
  //   "https://i.pinimg.com/564x/79/5f/05/795f0525783bc91912f2fbb567cb90e4.jpg",
  //   "https://i.pinimg.com/564x/de/9d/5e/de9d5efd1ac5ebcfb984f1c9b530fe37.jpg",
  //   "https://i.pinimg.com/564x/8c/ac/d9/8cacd960b3b97a6f1040f7740cb07850.jpg"
  // ];
  // List Chairimages = [
  //   "https://i.pinimg.com/564x/6a/b7/0b/6ab70b6a8be0d0ce83d040d60fb31d70.jpg",
  //   "https://i.pinimg.com/564x/94/55/11/9455111a5eaceb40ae286e0792fe8857.jpg",
  //   "https://i.pinimg.com/564x/f3/2b/2c/f32b2c0ce8c5dd618cbb0d98b705dbcc.jpg",
  //   "https://i.pinimg.com/564x/d6/00/e3/d600e30bee83dbc7dfa313029a3b9531.jpg",
  //   "https://i.pinimg.com/564x/f6/38/54/f63854d248a039f922d8dc4231707533.jpg",
  //   "https://i.pinimg.com/564x/cd/0a/5b/cd0a5bbc5491a9a9c5ff2c226935a9fb.jpg"
  // ];
  // List Clockimages = [
  //   "https://i.pinimg.com/564x/a0/62/7f/a0627fd70e1dbb483eeb266e5d64e705.jpg",
  //   "https://i.pinimg.com/564x/b9/16/e9/b916e9fb81a4cebdb4b229e569c28920.jpg",
  //   "https://i.pinimg.com/564x/31/32/27/313227bd4bf3a55ecc537c18eda1c1dd.jpg",
  //   "https://i.pinimg.com/564x/58/13/f3/5813f341c911cd3291e020be894be053.jpg",
  //   "https://i.pinimg.com/564x/53/8b/6d/538b6dc8ae2a3717afa6f3a1d219968d.jpg",
  //   "https://i.pinimg.com/564x/52/2b/f0/522bf04feb598aa99aa70e83c1b5f581.jpg"
  // ];
//  List Sofaimages = [
//     "https://i.pinimg.com/564x/36/67/af/3667af9a3914ce53010ee274f7e3ba31.jpg",
//     "https://i.pinimg.com/564x/6a/53/56/6a5356272399ae59d1066b51ee974134.jpg",
//     "https://i.pinimg.com/564x/f5/f2/41/f5f241b47e68c231dfb00f1490ce26b2.jpg",
//     "https://i.pinimg.com/564x/ac/d5/b6/acd5b635e19e5baccdb7bf82bd773528.jpg",
//     "https://i.pinimg.com/564x/0c/7b/2d/0c7b2dad5f84673cf2127c5bca919b65.jpg",
//     "https://i.pinimg.com/564x/9a/f3/96/9af3960436a7523054269ee3ec902654.jpg"
//   ];
  pushdata() {
    var res = FirebaseFirestore.instance
        .collection("products")
        .doc("categories")
        .set({
      "item": [
        {
          "image":
              "https://i.pinimg.com/564x/52/9a/86/529a86b9e08ea448582b0be8ecdf2890.jpg",
          "item": "6",
          "name": "sofa",
          "product": [
            {
              "image":
                  "https://i.pinimg.com/564x/36/67/af/3667af9a3914ce53010ee274f7e3ba31.jpg",
              "name": "Mid-Century Sofas",
              "price": "3000"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/6a/53/56/6a5356272399ae59d1066b51ee974134.jpg",
              "name": "Chesterfield Sofas",
              "price": "200"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/f5/f2/41/f5f241b47e68c231dfb00f1490ce26b2.jpg",
              "name": "Loveseat Sofas",
              "price": "3000"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/ac/d5/b6/acd5b635e19e5baccdb7bf82bd773528.jpg",
              "name": "Sleeper Sofas",
              "price": "2000"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/0c/7b/2d/0c7b2dad5f84673cf2127c5bca919b65.jpg",
              "name": "Relax Sofas",
              "price": "3000"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/9a/f3/96/9af3960436a7523054269ee3ec902654.jpg",
              "name": "Chaise Lounge",
              "price": "2000"
            }
          ]
        },
        {
          "image":
              "https://i.pinimg.com/564x/2f/92/4b/2f924b5f0c9718be6cd22a5d6b1d145b.jpg",
          "item": "6",
          "name": "Lamp",
          "product": [
            {
              "image":
                  "https://i.pinimg.com/564x/5a/d4/51/5ad451c14ea927c13e7ac1f818436bbd.jpg",
              "name": "Lamp1",
              "price": "600"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/b1/41/7d/b1417dd1a9ce1d7c07cd4e9aaf966d9c.jpg",
              "name": "Lamp2",
              "price": "500"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/e6/f7/99/e6f799978e7ff31e8fd301fa8525b812.jpg",
              "name": "Lamp3",
              "price": "300"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/79/5f/05/795f0525783bc91912f2fbb567cb90e4.jpg",
              "name": "Lamp4",
              "price": "200"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/de/9d/5e/de9d5efd1ac5ebcfb984f1c9b530fe37.jpg",
              "name": "Lamp5",
              "price": "300"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/8c/ac/d9/8cacd960b3b97a6f1040f7740cb07850.jpg",
              "name": "Lamp6",
              "price": "200"
            }
          ]
        },
        {
          "image":
              "https://i.pinimg.com/564x/73/2c/b5/732cb5ba6d7d18170f0dbfcc24cfc6b1.jpg",
          "item": "6",
          "name": "Chair",
          "product": [
            {
              "image":
                  "https://i.pinimg.com/564x/6a/b7/0b/6ab70b6a8be0d0ce83d040d60fb31d70.jpg",
              "name": "chair1",
              "price": "800"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/94/55/11/9455111a5eaceb40ae286e0792fe8857.jpg",
              "name": "chiar2",
              "price": "500"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/f3/2b/2c/f32b2c0ce8c5dd618cbb0d98b705dbcc.jpg",
              "name": "chair3",
              "price": "300"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/d6/00/e3/d600e30bee83dbc7dfa313029a3b9531.jpg",
              "name": "chair4",
              "price": "200"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/f6/38/54/f63854d248a039f922d8dc4231707533.jpg",
              "name": "chair5",
              "price": "300"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/cd/0a/5b/cd0a5bbc5491a9a9c5ff2c226935a9fb.jpg",
              "name": "chair6",
              "price": "200"
            }
          ]
        },
        {
          "image":
              "https://i.pinimg.com/564x/47/68/5c/47685c3c334ed95b0f3091f0471ccb60.jpg",
          "item": "6",
          "name": "Clock",
          "product": [
            {
              "image":
                  "https://i.pinimg.com/564x/a0/62/7f/a0627fd70e1dbb483eeb266e5d64e705.jpg",
              "name": "clock1",
              "price": "20"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/b9/16/e9/b916e9fb81a4cebdb4b229e569c28920.jpg",
              "name": "clock2",
              "price": "30"
            },
            {
              "image":
                  "hhttps://i.pinimg.com/564x/31/32/27/313227bd4bf3a55ecc537c18eda1c1dd.jpg",
              "name": "clock4",
              "price": "300"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/58/13/f3/5813f341c911cd3291e020be894be053.jpg",
              "name": "clock4",
              "price": "200"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/53/8b/6d/538b6dc8ae2a3717afa6f3a1d219968d.jpg",
              "name": "clock5",
              "price": "300"
            },
            {
              "image":
                  "https://i.pinimg.com/564x/52/2b/f0/522bf04feb598aa99aa70e83c1b5f581.jpg",
              "name": "clock6",
              "price": "200"
            }
          ]
        }
      ]
    });
    print("44444444444 ${res}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // catogaryitem();
    // fetchproduct();
    getcategories();
    pushdata();
  }

  var items = [];
  Future<List> getcategories() async {
    items.clear();

    var res = await FirebaseFirestore.instance
        .collection("products")
        .doc("categories")
        .get();
    print("iiiiiiii ${res.data()}");
    items.add(res.data()?["product"]);
    print("wwww ${items}");
    return items;
    // var res1 = await FirebaseFirestore.instance
    //     .collection("products")
    //     .doc("categories")
    //     .collection(items.toString())
    //     .get();
    // print(res1.docs);
  }
  // List<Product> products = [];
  // Future<void> fetchproduct() async {
  //   try {
  //     var res = await FirebaseFirestore.instance
  //         .collection("products")
  //         .doc("categories")
  //         .collection("details")
  //         .get();
  //     print("ssssssssssssssssss ${res.docs}");
  //     // QuerySnapshot detailsSnapshot =
  //     //     await FirebaseFirestore.instance.collection("products").get();
  //     // for (QueryDocumentSnapshot items in detailsSnapshot.docs) {
  //     //   for (String categories in ["chair", "clock", "sofas", "lamp"]) {
  //     //     QuerySnapshot productSnapshot = await FirebaseFirestore.instance
  //     //         .collection("products")
  //     //         .doc("categories")
  //     //         .collection("details")
  //     //         .doc(items.id)
  //     //         .collection("categories")
  //     //         .get();
  //     //     for (QueryDocumentSnapshot productDoc in productSnapshot.docs) {
  //     //       Map<String, dynamic> productData =
  //     //           productDoc.data() as Map<String, dynamic>;

  //     //       Product product = Product(
  //     //         name: productData['name'] ?? '',
  //     //         price: (productData['price'] ?? 0.0).toDouble(),
  //     //       );

  //     //       setState(() {
  //     //         products.add(product);
  //     //         print("sssssssssssssssssssss $products");
  //     //       });
  //     //     }
  //     //   }
  //     // }
  //   } catch (e) {
  //     print("Error fetching product data: $e");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: widget.exploreimage.length ?? 0,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisExtent: 265),
        itemBuilder: (context, index) {
          return Padding(
            padding:
                const EdgeInsets.only(left: 9.0, right: 9, top: 12, bottom: 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(6)),
                    width: 160,
                    height: 200,
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: Image.network(
                              widget.exploreimage[index]["image"],
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: double.infinity,
                            )),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              color: Colors.black,
                              onPressed: () {},
                              icon: Icon(
                                Icons.shopping_bag,
                                color: Color.fromARGB(255, 241, 71, 59),
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
                      widget.exploreimage[index]["name"],
                      style: GoogleFonts.robotoSlab(),
                    )),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      widget.exploreimage[index]["price"],
                      style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
