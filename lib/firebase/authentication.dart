import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:irohub_project/screens/Firstscreen.dart';
import 'package:irohub_project/screens/homescreen.dart';
import 'package:irohub_project/screens/loginscreen.dart';
import 'package:irohub_project/screens/signupscreen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();
  final auth = FirebaseAuth.instance;
  final deviceStorage = GetStorage();
  @override
  void onReady() {
    screenRedirect();
  }

  void screenRedirect() async {
    final user = auth.currentUser;
    if (user != null) {
      if (user.emailVerified) {
        Get.offAll(() => Homescreen());
      } else {
        Get.offAll(() => Loginscreen());
      }
    } else {
      deviceStorage.writeIfNull("IsFirstTime", true);
      deviceStorage.read("IsFirstTime") != true
          ? Get.offAll(Loginscreen())
          : Get.offAll(Firstscreen());
    }
  }

  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw "Somthing went wrong $e";
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      return await auth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw "Somthing went wrong $e";
    }
  }
}
