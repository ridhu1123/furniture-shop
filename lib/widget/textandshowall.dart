import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/showallscreen.dart';

class Showallbutton extends StatefulWidget {
  final text;

  Showallbutton({required this.text});

  @override
  State<Showallbutton> createState() => _ShowallbuttonState();
}

class _ShowallbuttonState extends State<Showallbutton> {
  List names = ["New Arravals", "Top Trends", "Best sellers", "Trending"];
// final SharedPreferences sharedPreferences = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: GoogleFonts.robotoSlab(fontSize: 20),
          ),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Showallscreen(
                              name: names.toString(),
                            )));
              },
              style: TextButton.styleFrom(foregroundColor: Colors.black),
              child: Row(
                children: [
                  Text(
                    "Show all",
                    style: GoogleFonts.robotoSlab(fontSize: 12),
                  ),
                  Icon(Icons.arrow_right)
                ],
              ))
        ],
      ),
    );
  }
}
