import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:irohub_project/constants/sharedpreference.dart';
import 'package:irohub_project/data/user/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  var id;

  List<Map<String, dynamic>> allDocument = <Map<String, dynamic>>[].obs;
  var userid;
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> saveUserRecord(UserModel user) async {
    print("hhhhhhhhhhhh");
    try {
      await _db.collection("users").doc(user.id).set(user.toJson());

      // SharedPreferences preferences = await SharedPreferences.getInstance();
      // var uid = preferences.getString("id");
      // id = uid;
      // print('id is $id');
      // print(user.image);
      // var res = await _db.collection("users").doc(user.id).get();
      // userid = res.id;
      // print("sssssssssss ${userid}");
      // cartscreen(id: userid);
    } catch (e) {
      throw "Somthing went wrong $e";
    }
  }

  //CartItemModel user,
  Future<void> saveCartRecord(UserModel user) async {
    // String myCart = "myCart";
    // var res = await _db.collection("users").doc(id).get();
    String cartedItems = "cartedItems";
    // String allItems = "allItems";
    DocumentReference documentReference =
        _db.collection("users").doc(shared_preferences_id);
    CollectionReference collectionReference =
        documentReference.collection(cartedItems);
    // DocumentReference childocumentReference = collectionReference.doc(allItems);
    // print("hhhhhhhhhhhh");
    // print("sssssssssss ${userid}");
    try {
      await collectionReference.add(user.toMyCart());
    } catch (e) {
      throw "Somthing went wrong $e";
    }
  }

  Future<List<Map<String, dynamic>>> getitems() async {
    try {
      // var res = await _db.collection("users").doc(userid).get();
      // print("cccccccccccccc${res.id}");
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection("users")
          .doc(shared_preferences_id
          )
          .collection("cartedItems")
          .get();
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> documentData = doc.data() as Map<String, dynamic>;
        allDocument.add(documentData);
        print(allDocument);
      });
      // var res = await FirebaseFirestore.instance
      //     .collection("users")
      //     .doc(userid)
      //     .collection("cartedItems")
      //     .doc("oTtw2TnXbDE4AOXTRgu")
      //     .get();
      // print("---------------- ${res.data()}");
    } catch (e) {
      print("vvvvvvvvvv $e");
    }
    return allDocument;
  }
}
