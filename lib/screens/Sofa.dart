import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/data/user/user_repository.dart';
import 'package:irohub_project/data/user/usermodel.dart';
import 'package:irohub_project/screens/Filterscreen.dart';
import 'package:irohub_project/screens/addtocart.dart';

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
  List Lampname = [""];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // catogaryitem();
    // fetchproduct();
    getcategories();
  }

  var items = [];
  Future<List> getcategories() async {
    items.clear();

    var res = await FirebaseFirestore.instance
        .collection("products")
        .doc("categories")
        .get();

    items.add(res.data()?["product"]);

    return items;
  }

  Future<void> storeCartItems(String name, String image, String price) async {
    try {
      // Get.put(AuthenticationRepository());
      // final userCredential = await AuthenticationRepository.instance
      //     .registerWithEmailAndPassword(
      //         emailcontroller.text.trim(), passwordcontroller.text.trim());

      final newuser = UserModel(productname: name, image: image, price: price
          // productId: userCredential.user!.uid,
          // productname: widget.proName["name"],
          // image: widget.proName["image"],
          // price: "${widget.proName["price"]}",
          // id: userCredential.user!.uid
          );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveCartRecord(newuser);
      // print("ddddddddddddd ${userRepository}");
    } catch (e) {
      print("fuck....$e");
    }
  }

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
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Addtocart1(
                                  proName: widget.exploreimage[index],
                                )));
                  },
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
                              onPressed: () {
                                storeCartItems(
                                    widget.exploreimage[index]["name"],
                                    widget.exploreimage[index]["image"],
                                    widget.exploreimage[index]["price"]);
                              },
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
                      maxLines: 1,
                      // overflow: ,
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
