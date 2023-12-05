import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/bottomnavigationclasses/home.dart';
import 'package:irohub_project/homescreen.dart';

class Thankyou extends StatelessWidget {
  const Thankyou({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/[removal.ai]_24884dc3-a15b-45b6-8c00-9574b979ffb5_28788616_02june22_basket_icon_04.png",
                height: 180,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Thank you!",
                  style: GoogleFonts.robotoSlab(fontSize: 30),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Homescreen()));
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.black),
                  child: Text(
                    "Continue shopping",
                    style: GoogleFonts.robotoSlab(),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
