import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/forgetpassword.dart';
import 'package:irohub_project/homescreen.dart';

import 'package:irohub_project/signupscreen.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

TextEditingController _emailcontroller = TextEditingController();
TextEditingController _passwordcontroller = TextEditingController();

class _LoginscreenState extends State<Loginscreen> {
  static Loginscreen get instance => Get.find();
  final FirebaseAuth auth = FirebaseAuth.instance;
  // Future<UserCredential> facebooksignin() async {
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //   final OAuthCredential facebookAuthCredential =
  //       FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.cancel),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text(
              "Login",
              style: GoogleFonts.robotoSlab(fontSize: 25),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: TextFormField(
              controller: _emailcontroller,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "email",
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.grey[400]),
              ),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: TextFormField(
              controller: _passwordcontroller,
              decoration: InputDecoration(
                border: UnderlineInputBorder(),
                labelText: "password",
                labelStyle: TextStyle(
                    fontWeight: FontWeight.w400, color: Colors.grey[400]),
              ),
            ),
          ),
          SizedBox(
            height: 60,
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Homescreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Colors.black),
              child: Text(
                "LOGIN",
                style: GoogleFonts.aBeeZee(color: Colors.white),
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Forgetpassword()));
            },
            child: Text(
              "forget your password ?",
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.all(17.0),
            child: ElevatedButton(
              onPressed: () async {
                // try {
                //   facebooksignin();
                //   if (context.mounted) {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => Signupscreen()));
                //   }
                // } catch (e) {
                //   MotionToast.error(description: Text("error")).show(context);
                // }
                // facebooksignin();
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons8-google-48.png",
                    height: 17,
                  ),
                  Text(
                    " LOGIN WITH GOOGLE",
                    style: GoogleFonts.aBeeZee(color: Colors.blue),
                  ),
                ],
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Signupscreen(),
                ),
              );
            },
            child: Text(
              "Don't have an account? Sign Up",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
