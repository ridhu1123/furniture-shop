import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/Sofa.dart';
import 'package:irohub_project/categoriessecondscreen.dart';

class categoryscreen extends StatefulWidget {
  final allitems;
  const categoryscreen({super.key,required this.allitems});

  @override
  State<categoryscreen> createState() => _categoryscreenState();
}

class _categoryscreenState extends State<categoryscreen> {
  List catogarisimages=[
     "https://i.pinimg.com/564x/cb/f3/d5/cbf3d5c06cd9d599767702d4be82bae9.jpg",
    
    "https://i.pinimg.com/564x/de/33/92/de33929f773fd64883dd4e2c2d444099.jpg",

    "https://i.pinimg.com/564x/fc/09/8f/fc098f4f57f603cd8d5bdbcd1bd21277.jpg",
   "https://i.pinimg.com/564x/cb/d7/c8/cbd7c8b35ef2fb203b49fb20b803eb3f.jpg",
  ];
  List categoriesname = [
    "Sofa",
    "Lamps",
    "Chair",
    "Clock",
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
          separatorBuilder: (context, index) => Divider(thickness: 0.5,),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: categoriesname.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 28,left: 8,right: 8,bottom: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(catogarisimages[index],fit: BoxFit.fill,width: 90,
                      height: 90,)),
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
                                  builder: (context) => Sofascreen()));
                        },
                        icon: Icon(Icons.arrow_right,size: 40,)),
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
