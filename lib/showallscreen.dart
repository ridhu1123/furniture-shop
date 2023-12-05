import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Showallscreen extends StatefulWidget {
  String name;
  Showallscreen({super.key, required this.name});

  @override
  State<Showallscreen> createState() => _ShowallscreenState();
}

class _ShowallscreenState extends State<Showallscreen> {
  // String names="";
  @override
  Widget build(BuildContext context) {
    // if (widget.name == "New Arrivals") {
    //   names = "New Arrivals";
    // }
    // if(widget.name=="Top Trends"){
    //    names = "Top Trends";
    // } if (widget.name == "Best sellers") {
    //   names = "Best sellers";
    // }
    // if(widget.name=="Trending"){
    //    names = "Trending";
    // }
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 25),
              child: Text(
                "Best sellers",
                style: GoogleFonts.robotoSlab(
                    fontSize: 30, fontWeight: FontWeight.w600),
              ),
            ),
            // LimitedBox(
            //   maxHeight: 732,
            //   child: GridView.builder(
            //       itemCount: 8,
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 2, mainAxisExtent: 260),
            //       itemBuilder: (context, index) {
            //         return Padding(
            //           padding: const EdgeInsets.only(
            //               left: 9.0, right: 9, top: 12, bottom: 5),
            //           child: Column(
            //             crossAxisAlignment: CrossAxisAlignment.start,
            //             children: [
            //               InkWell(
            //                 onTap: () {},
            //                 child: Container(
            //                   decoration: BoxDecoration(
            //                       color: Colors.grey[200],
            //                       borderRadius: BorderRadius.circular(6)),
            //                   width: 160,
            //                   height: 200,
            //                   child: Stack(
            //                     children: [
            //                       Align(
            //                         alignment: Alignment.topRight,
            //                         child: IconButton(
            //                             color: Colors.black,
            //                             onPressed: () {},
            //                             icon: Icon(
            //                               Icons.favorite_border,
            //                               size: 18,
            //                             )),
            //                       )
            //                     ],
            //                   ),
            //                 ),
            //               ),
            //               Align(
            //                   alignment: Alignment.topLeft,
            //                   child: Text(
            //                     "newarrivalsname[index]",
            //                     style: GoogleFonts.robotoSlab(),
            //                   )),
            //               Align(
            //                   alignment: Alignment.topLeft,
            //                   child: Text(
            //                     "29",
            //                     style: GoogleFonts.robotoSlab(
            //                         color: Colors.grey[400]),
            //                   ))
            //             ],
            //           ),
            //         );
            //       }),
            // ),
          ],
        ),
      ),
    );
  }
}
