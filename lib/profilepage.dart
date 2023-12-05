import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
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
                icon: Icon(Icons.arrow_back))),
        Padding(
          padding: const EdgeInsets.only(left: 18, top: 10, bottom: 10),
          child: Text(
            "My Account",
            style: GoogleFonts.robotoSlab(
                fontSize: 30, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(
                  "https://img.freepik.com/free-vector/handsome-man-face-cartoon_1308-150481.jpg"),
            ),
            title: Text(
              "Gregory Bates",
              style: GoogleFonts.robotoSlab(),
            ),
            subtitle: Text(
              "samir.runte@newell.org",
              style: GoogleFonts.robotoSlab(color: Colors.grey, fontSize: 10),
            ),
          ),
        ),
        ListTile(
          leading: Text(
            "Wishlist",
            style: GoogleFonts.robotoSlab(),
          ),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Divider(),
        ),
        ListTile(
          leading: Text(
            "My Orders",
            style: GoogleFonts.robotoSlab(),
          ),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Divider(),
        ),
        ListTile(
          leading: Text(
            "Payment Method",
            style: GoogleFonts.robotoSlab(),
          ),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Divider(),
        ),
        ListTile(
          leading: Text(
            "Delivery Address",
            style: GoogleFonts.robotoSlab(),
          ),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Divider(),
        ),
        ListTile(
          leading: Text(
            "Gift cards & vouchers",
            style: GoogleFonts.robotoSlab(),
          ),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Divider(),
        ),
        ListTile(
          leading: Text(
            "Contect perfernces",
            style: GoogleFonts.robotoSlab(),
          ),
          trailing: Icon(Icons.arrow_forward_ios_outlined),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Divider(),
        ),
      ],
    ));
  }
}
