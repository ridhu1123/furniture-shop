import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:irohub_project/widget/loaders/animation_loader.dart';

class TFullScreenLoader{
  static void openLoadingDialog(String text,String animation){
    showDialog(context: Get.overlayContext!, builder: (_) =>PopScope(canPop: false,child: Container(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 250,),
          TAnimationLoader(text: text, animation: animation)
        ],
      ),
    )) ,);
  }
  static stopLoading(){
    Navigator.of(Get.overlayContext!).pop();
  }
}