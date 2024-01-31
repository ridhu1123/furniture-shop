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

  List<Map<String, dynamic>> allDocument = [];
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

 Stream<List<Map<String, dynamic>>> getItemsStream() {
  try {
    Stream<QuerySnapshot> querySnapshotStream = FirebaseFirestore.instance
        .collection("users")
        .doc(shared_preferences_id)
        .collection("cartedItems")
        .snapshots();

    return querySnapshotStream.map((querySnapshot) {
      List<Map<String, dynamic>> allDocuments = [];
      querySnapshot.docs.forEach((doc) {
        Map<String, dynamic> documentData = doc.data() as Map<String, dynamic>;
        allDocuments.add(documentData);
      });
      return allDocuments;
    });
  } catch (e) {
    // You might want to handle errors appropriately here
    print("Error fetching items: $e");
    return Stream.empty(); // Return an empty stream in case of error
  }
}

 Future<void> saveCheckOutRecord(UserModel user) async {
    // String myCart = "myCart";
    // var res = await _db.collection("users").doc(id).get();
    String CheckOutDetails = "CheckOutDetails";
    // String allItems = "allItems";
    DocumentReference documentReference =
        _db.collection("users").doc(shared_preferences_id);
    CollectionReference collectionReference =
        documentReference.collection(CheckOutDetails);
    // DocumentReference childocumentReference = collectionReference.doc(allItems);
    // print("hhhhhhhhhhhh");
    // print("sssssssssss ${userid}");
    try {
      await collectionReference.add(user.toMyCheckOut());
    } catch (e) {
      throw "Somthing went wrong $e";
    }
  }
}
