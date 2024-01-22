import 'dart:async';

import 'package:firebase_core/firebase_core.dart'; 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/firebase/authentication.dart';
import 'package:irohub_project/screens/Firstscreen.dart';
void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // Get.put(AuthenticationRepository());
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Get.put(AuthenticationRepository());
    return GetMaterialApp(
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
      // initialBinding:GenaralBinding() ,
      // initialRoute: ,
    );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Firstscreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: 250,
                  child: Image.asset(
                    "assets/a__2_-removebg-preview (2).png",
                  ),
                ),
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "from",
                    style: TextStyle(color: Colors.white),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/icons8-google-144.png",
                    height: 20,
                  ),
                  Text(
                    "  google",
                    style: GoogleFonts.acme(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ));
  }
}
