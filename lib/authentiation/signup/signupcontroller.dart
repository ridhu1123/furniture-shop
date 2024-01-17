import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:irohub_project/authentiation/usserauth.dart';
import 'package:irohub_project/data/user/user_repository.dart';
import 'package:irohub_project/data/user/usermodel.dart';
import 'package:irohub_project/firebase/authentication.dart';
import 'package:irohub_project/utils/popups/fullscreenloader.dart';
import 'package:irohub_project/widget/loaders/snakbar.dart';

class SignupController extends GetxController{
  final hidePassword=true.obs;
 static SignupController get instance=>Get.find();
TextEditingController namecontroller = TextEditingController();
TextEditingController emailcontroller = TextEditingController();
TextEditingController  passwordcontroller= TextEditingController();
TextEditingController phonenumbercontroller = TextEditingController();
GlobalKey<FormState>signupFormKey=GlobalKey<FormState>();

 void Signup()async{
  try {
    TFullScreenLoader.openLoadingDialog("we are processing your information","assets/Animation - 1705523897423.json" );
    if (!signupFormKey.currentState!.validate()) {
      TFullScreenLoader.stopLoading();
      return;
    }
 final userCredential= await AuthenticationRepository.instance.registerWithEmailAndPassword(emailcontroller.text.trim(), passwordcontroller.text.trim());
 final newuser=UserModel(id: userCredential.user!.uid, name: namecontroller.text.trim(), email: emailcontroller.text.trim(), phonenumber: phonenumbercontroller.text.trim());
 final userRepository=Get.put(UserRepository());
 await userRepository.saveUserRecord(newuser);
  } catch (e) {
    SnackBarLoader.errorSnackbar(title: "Oh Snap!",message: e.toString());
  }
  finally{
    TFullScreenLoader.stopLoading();
  }
 }
}