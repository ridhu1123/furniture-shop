import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/screens/Firstscreen.dart';
import 'package:irohub_project/screens/homescreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  // Get.put(AuthenticationRepository());

  await Firebase.initializeApp();
  // await GetStorage.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Splashscreen(),
      debugShowCheckedModeBanner: false,
      // initialBinding:GenaralBinding() ,
    );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  var finalemial;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getVaidationData().whenComplete(() async {
      Timer(Duration(seconds: 2),
          () => Get.offAll(finalemial == null ? Firstscreen() : Homescreen()));
    });
  }

  Future getVaidationData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var obtainemial = prefs.getString("email");
    setState(() {
      finalemial = obtainemial;
    });
    print(finalemial);
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
