import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/categoriessecondscreen.dart';

class categoryscreen extends StatefulWidget {
  const categoryscreen({super.key});

  @override
  State<categoryscreen> createState() => _categoryscreenState();
}

class _categoryscreenState extends State<categoryscreen> {
  List categoriesname = [
    "Decoration",
    "Celling",
    "Floor",
    "Furniture",
    "Lamps",
    "Wooden"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.2,
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            "Categories",
            style: GoogleFonts.robotoSlab(color: Colors.black),
          ),
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: categoriesname.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(6)),
                      width: 90,
                      height: 90,
                      // child: Image.network("src"),
                    ),
                  ),
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 9, right: 8, top: 8),
                          child: Text(
                            categoriesname[index],
                            style: GoogleFonts.robotoSlab(),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "100 items",
                          style:
                              GoogleFonts.robotoSlab(color: Colors.grey[400]),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Categoriessecond()));
                        },
                        icon: Icon(Icons.arrow_right)),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
