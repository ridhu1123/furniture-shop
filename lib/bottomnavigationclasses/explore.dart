import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:irohub_project/showallscreen.dart';
import 'package:irohub_project/widget/textandshowall.dart';

class Explorescreen extends StatefulWidget {
  const Explorescreen({super.key});

  @override
  State<Explorescreen> createState() => _ExplorescreenState();
}

class _ExplorescreenState extends State<Explorescreen> {
  Map<String, List<String>> folderImageUrls = {};
  List exploreimage = [
    "https://i.pinimg.com/564x/79/91/58/799158da597625ffa054d48fecdef369.jpg",
    "https://i.pinimg.com/564x/f1/20/ba/f120ba0160225cf18a564a67e3bb22c6.jpg",
    "https://i.pinimg.com/564x/df/66/0e/df660ef6ec3351b9c8ef06606661893e.jpg"
  ];
  List explorename = ["Sofa", "Lamps", "Chair"];
  List exploreitems = ["10", "5", "6"];
  List newarrivals = [
    "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
    "assets/40446cd0-7055-4954-89fa-e2bb3c0ecb5b.jpg",
    "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
    "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
    "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
    "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
    "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
    "assets/New Works by Studio Cecilia Xinyu Zhang.jpg",
  ];
  List newarrivalsname = [
    "Nancy chair",
    "Nancy chair",
    "Nancy chair",
    "Nancy chair",
    "Nancy chair",
    "Nancy chair",
    "Nancy chair",
    "Nancy chair",
  ];
  List newarrivalsprize = [
    "€29.00",
    "€29.00",
    "€29.00",
    "€29.00",
    "€29.00",
    "€29.00",
    "€29.00",
    "€29.00",
  ];
  var imageurls=[];
  void getdata()async{
    try{
 var storage = FirebaseStorage.instance;
 
 var folders = ['new arrival', 'Top trend', 'Top deals'];

 for (var folder in folders) {
        var ref = storage.ref().child('homescreenimages/$folder');

        var imageUrls = await ref.listAll();

        List<String> urls = [];

        for (var imageRef in imageUrls.items) {
          var url = await imageRef.getDownloadURL();
          urls.add(url);
        }

        setState(() {
          folderImageUrls[folder] = urls;
        });
      }
    } catch (error) {
      print('Error fetching images: $error');
    }
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 55),
              child: Text(
                "Explore",
                style: GoogleFonts.robotoSlab(
                    fontSize: 30, fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            LimitedBox(
              maxHeight: 225,
              child: ListView.builder(
                  itemCount: exploreimage.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 160,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                exploreimage[index],
                                height: 172,
                                width: double.infinity,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  explorename[index],
                                  style: GoogleFonts.robotoSlab(),
                                )),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "${exploreitems[index]} items",
                                  style: GoogleFonts.robotoSlab(
                                      color: Colors.grey[400]),
                                ))
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            InkWell(
              onTap: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Showallscreen(name: "Best sellers")));
              },
              child: Showallbutton(text: "Best sellers")),
            Container(
              height: 600,
              child: GridView.builder(
                itemCount: imageurls.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 4, crossAxisCount: 2, mainAxisExtent: 250),
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
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
                              height: 190,
                              child:Image.network(imageurls[index]["new arrival"])
                            ),
                          ),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                newarrivalsname[index],
                                style: GoogleFonts.robotoSlab(),
                              )),
                          Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                newarrivalsprize[index],
                                style: GoogleFonts.robotoSlab(
                                    color: Colors.grey[400]),
                              ))
                        ],
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
