import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:irohub_project/authentiation/signup/signupcontroller.dart';
import 'package:irohub_project/firebase/authentication.dart';
import 'package:irohub_project/screens/homescreen.dart';
import 'package:irohub_project/utils/popups/fullscreenloader.dart';

class LoginController {
void clearTextEditingController(){
    passwordcontroller.clear();
   
    emailcontroller.clear();
    
  }

  final controller=Get.put(SignupController());
  final hidePassword = true.obs;
  final localstorage = GetStorage();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  void signIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "assets/Animation - 1705692235217.json");
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      Get.put(AuthenticationRepository());
      final userCredentials = await AuthenticationRepository.instance
          .signInWithEmailAndPassword(
              emailcontroller.text.trim(), passwordcontroller.text.trim());
      // TFullScreenLoader.stopLoading();
      // AuthenticationRepository.instance.screenRedirect();
      controller.clearTextEditingController();
      // localstorage.write("userId", value.)
      Get.to(() => Homescreen());
    } catch (e) {}
  }
}
