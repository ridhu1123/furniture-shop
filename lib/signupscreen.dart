import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginscreen.dart';

class Signupscreen extends StatefulWidget {
  const Signupscreen({super.key});

  @override
  State<Signupscreen> createState() => _SignupscreenState();
}

TextEditingController _emailcontroller = TextEditingController();
TextEditingController _passwordcontroller = TextEditingController();
TextEditingController _phonecontroller = TextEditingController();
TextEditingController _birthcontroller = TextEditingController();
TextEditingController _adresscontroller = TextEditingController();

class _SignupscreenState extends State<Signupscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
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
          "Personal details",
          style: GoogleFonts.robotoSlab(fontSize: 25),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 13),
        child: TextFormField(
          controller: _emailcontroller,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "email",
            labelStyle:
                TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[400]),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 13),
        child: TextFormField(
          controller: _passwordcontroller,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "password",
            labelStyle:
                TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[400]),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 13),
        child: TextFormField(
          controller: _phonecontroller,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "phonenumber",
            labelStyle:
                TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[400]),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 13),
        child: TextFormField(
          controller: _birthcontroller,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "date of birth",
            labelStyle:
                TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[400]),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 13),
        child: TextFormField(
          controller: _adresscontroller,
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            labelText: "address",
            labelStyle:
                TextStyle(fontWeight: FontWeight.w400, color: Colors.grey[400]),
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
                builder: (context) => Loginscreen(),
              ),
            );
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          child: Text(
            "SIGN UP",
            style: GoogleFonts.aBeeZee(color: Colors.white),
          ),
        ),
      ),
      SizedBox(
        height: 45,
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
          "Already have an account? Sign in",
          style: TextStyle(color: Colors.black),
        ),
      ),
    ]));
  }
}
