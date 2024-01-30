// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:irohub_project/constants/controllers.dart';
// import 'package:irohub_project/data/user/usermodel.dart';
// import 'package:irohub_project/features/shop/models/cart_item_model.dart';
// import 'package:irohub_project/screens/Filterscreen.dart';
// import 'package:uuid/uuid.dart';

// class Cartcontroller extends GetxController {
//   static Cartcontroller get instance => Get.find();

//   @override
//   void onReady() {
//     super.onReady();
// // ever(usercontroller.usermodel,changeCartTotalPrice);
//   }

//   Future<void> storeCartItems(UserModel user) async {
//     try {
//       //   if (_isItemAlreadAdded(user)) {
//       //     Get.snackbar("Check your cart", "${user.productname} is allready added");
//       //   }
//       //  else{
//       String itemId = Uuid().toString();
//       usercontroller.updateUserData({
//         "cart": FieldValue.arrayUnion([
//           {
//             "id": itemId,
//             "productname": user.productname,
//             "image": user.image,
//             "price": user.price
//           }
//         ])
//       });
//       Get.snackbar("Item added", "${user.productname} was added to your cart");
//     }

//     // }
//     catch (e) {
//       Get.snackbar("error", "cannot added this item");
//       debugPrint(e.toString());
//     }
//   }

//   void removeCartItem(CartItemModel cartItem) {
//     try {
//       usercontroller.updateUserData({
//         "cart": FieldValue.arrayRemove([cartItem.toJson()])
//       });
//     } catch (e) {
//       Get.snackbar("error", "cant remove item");
//     }
//   }

//   bool _isItemAlreadAdded(UserModel user) =>
//       usercontroller.usermodel.value.cart!
//           .where((item) => item.id == user.id)
//           .isNotEmpty;
// }
