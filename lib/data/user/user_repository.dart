import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:irohub_project/data/user/usermodel.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  Future<void> saveUserRecord(UserModel user) async {
    print("hhhhhhhhhhhh");
    try {
      await _db.collection("users").doc(user.id).set(user.toJson());
    } catch (e) {
      throw "Somthing went wrong $e";
    }
  }

  
}
