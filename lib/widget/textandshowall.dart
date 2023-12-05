import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Showall extends StatelessWidget {
  final text;
  
  const Showall({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: GoogleFonts.robotoSlab(fontSize: 20),
          ),
          TextButton(
              onPressed: () {},
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
