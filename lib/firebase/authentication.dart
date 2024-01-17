import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController{
  static AuthenticationRepository get instance =>Get.find();
final auth=FirebaseAuth.instance;



Future<UserCredential> registerWithEmailAndPassword(String email,String password)async{
  try {
    return await auth.createUserWithEmailAndPassword(email: email, password: password);
  } catch (e) {
    throw "Somthing went wrong";
  }
}
}