import 'dart:convert';
import 'dart:io';


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:irohub_project/cartscreen.dart';
import 'package:irohub_project/giftcardscreen.dart';
import 'package:permission_handler/permission_handler.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  String image = "";
  File? _image;
  String _image1 = "";

  getcameraimage() async {
    final camerapicked =
        await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      if (camerapicked != null) {
        _image1 = camerapicked.path;
        _image = File(camerapicked.path);
        print(json.encode(_image1));  
        print("filepath.............");
      } else {
        print("no image found");
      }
    });
  }
  getimage() async {
    final pickedimage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedimage != null) {
        _image1 = pickedimage.path;
        _image = File(pickedimage.path);
      
      } else {
        print("no image found");
      }
    });
  }
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
        Center(
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                context: context,
                builder: (context) {
                  return Container(
                    height: 150,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(19)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 3.5,
                                width: 30,
                                decoration: BoxDecoration(
                                    color: Colors.grey[600],
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            )
                          ],
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Text(
                              "Profile photo",
                              style: GoogleFonts.robotoSlab(
                                  fontSize: 20, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            255, 219, 218, 218))),
                                child: IconButton(
                                    onPressed: () {
                                      getcameraimage();
                                    },
                                    icon: Icon(
                                      Icons.camera_alt_rounded,
                                      color: Colors.green,
                                    )),
                              ),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            255, 219, 218, 218))),
                                child: IconButton(
                                    onPressed: () async {
                                      var status =
                                          await Permission.storage.request();
                                      if (status == PermissionStatus.granted) {
                                        getimage();
                                      } else {
                                        print("ssssssssssssssssss");
                                      }
                                    },
                                    icon: Icon(
                                      Icons.photo,
                                      color: Colors.green,
                                    )),
                              ),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: const Color.fromARGB(
                                            255, 219, 218, 218))),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.green,
                                    )),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
              );
            },
            child: _image != null
                ? CircleAvatar(
                    radius: 60,
                    backgroundImage: FileImage(_image!),
                  )
                // Image.file(
                //     _image!,
                //     fit: BoxFit.fill,
                //   )
                : CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(
                        "https://i.pinimg.com/564x/39/94/fb/3994fb52d1f983d003ed6f084366bdab.jpg"),
                  ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            "Gregory Bates",
            style: GoogleFonts.robotoSlab(),
          ),
        ),
        Center(
          child: Text(
            "samir.runte@newell.org",
            style: GoogleFonts.robotoSlab(color: Colors.grey, fontSize: 10),
          ),
        ),
        SizedBox(
          height: 20,
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
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => cartscreen()));
          },
          child: ListTile(
            leading: Text(
              "My Orders",
              style: GoogleFonts.robotoSlab(),
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
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
        InkWell(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Giftcard()));
          },
          child: ListTile(
            leading: Text(
              "Gift cards & vouchers",
              style: GoogleFonts.robotoSlab(),
            ),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
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
