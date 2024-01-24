import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:irohub_project/data/user/user_repository.dart';
import 'package:irohub_project/data/user/usermodel.dart';

class Usercontroller extends GetxController {
  static Usercontroller get instance => Get.find();

  final userRepository = Get.put(UserRepository());

  Future<UserCredential?> saveUserRecordFromGoogle(
      UserCredential? userCredential) async {
    try {
      if (userCredential != null) {
        final user = UserModel(
            id: userCredential.user!.uid,
            name: userCredential.user!.displayName ?? "",
            email: userCredential.user!.email ?? "",
            phonenumber: userCredential.user!.phoneNumber ?? "not requird");
        await userRepository.saveUserRecord(user);
      }
    } catch (e) {
      print("somthing went wrong $e");
    }
  }
}
