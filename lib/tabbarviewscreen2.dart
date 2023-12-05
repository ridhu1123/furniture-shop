import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Collectiontabbar extends StatefulWidget {
  const Collectiontabbar({super.key});

  @override
  State<Collectiontabbar> createState() => _CollectiontabbarState();
}

class _CollectiontabbarState extends State<Collectiontabbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          itemCount: 4,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, mainAxisExtent: 260),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 9.0, right: 9, top: 12, bottom: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(6)),
                      width: 160,
                      height: 200,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: IconButton(
                                color: Colors.black,
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border,
                                  size: 18,
                                )),
                          )
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "newarrivalsname[index]",
                        style: GoogleFonts.robotoSlab(),
                      )),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "29",
                        style: GoogleFonts.robotoSlab(color: Colors.grey[400]),
                      ))
                ],
              ),
            );
          }),
    );
  }
}