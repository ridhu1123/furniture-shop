import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:irohub_project/googlemap.dart';
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
              Image.network(
                "https://i.pinimg.com/564x/e0/03/67/e00367c886229da4cbc9b241e9b9b990.jpg",
                height: 180,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Thank you!",
                  style: GoogleFonts.robotoSlab(fontSize: 30),
                ),
              ),
              Text("""         Your order is completed.
Please check the delivery status at""",
                  style: GoogleFonts.robotoSlab(color: Colors.black)),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => googlemap()));
                  },
                  child: RichText(
                      text: TextSpan(children: [
                    TextSpan(
                      text: "ORDER TRACKING ",
                      style: GoogleFonts.robotoSlab(
                          color: Colors.black, fontWeight: FontWeight.w600),
                    ),
                    TextSpan(
                      text: " click here",
                      style: GoogleFonts.robotoSlab(
                          decoration: TextDecoration.underline,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )
                  ]))
                  //  Text(
                  //   "ORDER TRACKING click here",
                  //   style: GoogleFonts.robotoSlab(
                  //       color: Colors.black, fontWeight: FontWeight.w600),
                  // )
                  ),
              SizedBox(
                height: 120,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => Homescreen()));
                  },
                  style:
                      ElevatedButton.styleFrom(shape: RoundedRectangleBorder(),backgroundColor: Colors.black),
                  child: Text(
                    "Continue shopping",
                    style: GoogleFonts.robotoSlab(color: Colors.white),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
