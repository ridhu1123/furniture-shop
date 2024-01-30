import 'package:irohub_project/constants/appconstants.dart';
import 'package:irohub_project/features/shop/models/cart_item_model.dart';

class UserModel {
  String? productname;
  String? image;
  String? price;
  final String? id;
  String? name;
  final String? email;
  String? phonenumber;
  // List? cart;
  UserModel(
      {this.id,
      this.name,
      this.email,
      this.phonenumber,
      this.productname,
      this.image,
      this.price,
      });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "Fullname": name,
      "email": email,
      "phonenumber": phonenumber,
      // "cart": cart
    };
  }
  Map<String, dynamic> toMyCart() {
    return {"productname": productname, "image": image, "price": price};
  }

  //  UserModel.fromjson(DocumentSnapshot snapshot) {

  //  name=snapshot.data()["name"];
  //  email=snapshot.data()["email"];
  //  id=snapshot.data()["id"];
  //  cart=_converCartItems(snapshot.data()["cart"]??[]);

  // }

  // convert cart item model in to map in firebase firestore

  List<CartItemModel> _converCartItems(List cartFromFb) {
    List<CartItemModel> _result = [];
    logger.i(cartFromFb.length);
    cartFromFb.forEach((element) {
      _result.add(CartItemModel.fromjson(element));
    });
    return _result;
  }
}
