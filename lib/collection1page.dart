


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:irohub_project/sale70%25screen.dart';

class Secondcollectionpage extends StatefulWidget {
  String? title;
  String? subtitle;
  String? images1;
  Secondcollectionpage({
    super.key,
  });
  Secondcollectionpage.name(
      { this.title,  this.subtitle,  this.images1});
  @override
  State<Secondcollectionpage> createState() => _SecondcollectionpageState();
}

class _SecondcollectionpageState extends State<Secondcollectionpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // users=FirebaseFirestore.instance.collection("user");
    // print("aaaaaaaaaaaaaaaaaaaaaa ${users}");
  }
//    late CollectionReference users;
// Future<List<QueryDocumentSnapshot>> fetchdata()async{
//   QuerySnapshot querySnapshot=await users.get();
//   return querySnapshot.docs;
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
                        children: [
                              Align(
            alignment: Alignment.topLeft,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back))),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            "Collection",
            style: GoogleFonts.robotoSlab(fontSize: 30),
          ),
        ),
    //  FutureBuilder(future: fetchdata(), builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //           return CircularProgressIndicator();
    //         }else if (snapshot.hasError) {
    //           return Text('Error: ${snapshot.error}');
    //         } else{
    //           List<QueryDocumentSnapshot>data=snapshot.data as List<QueryDocumentSnapshot>;
    //         return LimitedBox(
    //           maxHeight: 500,
    //           child: ListView.builder(
    //             itemCount: data.length,
    //             itemBuilder: (context, index) {
    //             return 
                
                Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Container(
              height: 506,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(8, 9),
                        blurRadius: 10,
                        color: Color.fromARGB(255, 119, 117, 117))
                  ],
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.grey[200]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                     widget.images1!,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        widget.subtitle!,
                        style: GoogleFonts.robotoSlab(
                            color: Colors.grey[500],
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                      widget.title!,
                        style: GoogleFonts.robotoSlab(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 8),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Cybermonday.name(title:widget.title,subtitile: widget.subtitle,images1: widget.images1,)));
                          },
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black, width: 1.0))),
                                child: Text(
                                  "SHOP NOW",
                                  style: GoogleFonts.robotoSlab(
                                    fontSize: 10,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.black,
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
                        ),
                      )
                     ] )
                      );
                    
              }
            
            
            
            }
    

        // Padding(
        //   padding: const EdgeInsets.all(14.0),
        //   child: Container(
        //     height: 506,
        //     decoration: BoxDecoration(
        //         boxShadow: [
        //           BoxShadow(
        //               offset: Offset(8, 9),
        //               blurRadius: 10,
        //               color: Color.fromARGB(255, 119, 117, 117))
        //         ],
        //         borderRadius: BorderRadius.circular(15),
        //         color: Colors.grey[200]),
        //     child: Column(
        //       children: [
        //         Padding(
        //           padding: const EdgeInsets.all(8.0),
        //           child: Image.asset(
        //             "",
        //             fit: BoxFit.fill,
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 10),
        //           child: Align(
        //             alignment: Alignment.bottomLeft,
        //             child: Text(
        //               "",
        //               style: GoogleFonts.robotoSlab(
        //                   color: Colors.grey[500],
        //                   fontSize: 12,
        //                   fontWeight: FontWeight.w400),
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 10),
        //           child: Align(
        //             alignment: Alignment.bottomLeft,
        //             child: Text(
        //              "",
        //               style: GoogleFonts.robotoSlab(
        //                   color: Colors.black,
        //                   fontSize: 30,
        //                   fontWeight: FontWeight.w500),
        //             ),
        //           ),
        //         ),
        //         Padding(
        //           padding: const EdgeInsets.only(left: 10, top: 8),
        //           child: Align(
        //             alignment: Alignment.bottomLeft,
        //             child: TextButton(
        //                 onPressed: () {
        //                   Navigator.push(
        //                       context,
        //                       MaterialPageRoute(
        //                           builder: (context) => Cybermonday.name(title:widget.title,subtitile: widget.subtitle,images1: widget.images1,)));
        //                 },
        //                 child: Row(
        //                   children: [
        //                     Container(
        //                       decoration: BoxDecoration(
        //                           border: Border(
        //                               bottom: BorderSide(
        //                                   color: Colors.black, width: 1.0))),
        //                       child: Text(
        //                         "SHOP NOW",
        //                         style: GoogleFonts.robotoSlab(
        //                           fontSize: 10,
        //                           color: Colors.black,
        //                         ),
        //                       ),
        //                     ),
        //                     Icon(
        //                       Icons.arrow_right,
        //                       color: Colors.black,
        //                     )
        //                   ],
        //                 )),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // )
                      
       
      
          
      
      
      
      
      
    