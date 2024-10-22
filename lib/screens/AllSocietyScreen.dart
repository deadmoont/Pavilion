import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavilion/components/loading_view.dart';
import 'package:pavilion/database/Apis.dart';
import 'package:pavilion/screens/event_screen.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class AllSocietyScreen extends StatefulWidget {
  @override
  State<AllSocietyScreen> createState() => _AllSocietyScreenState();
}

class _AllSocietyScreenState extends State<AllSocietyScreen> {
  List<Map<String, String>> societyList = [
    {
      "name": "AMS",
      "description":
      "A society dedicated to capturing moments through the lens, focusing on photography and videography."
    },
    {
      "name": "GeneticX",
      "description":
      "A dynamic dance group that explores various dance forms and promotes self-expression through movement."
    },
    {
      "name": "Nirmiti",
      "description":
      "A creative club for fine arts enthusiasts, nurturing skills in painting, sketching, and other artistic expressions."
    },
    {
      "name": "Rangtarangini",
      "description":
      "A drama society that brings stories to life through acting, theater performances, and stage plays."
    },
    {
      "name": "Virtuosi",
      "description":
      "A music group that celebrates the art of sound, providing a platform for singers, instrumentalists, and music lovers."
    },
    {
      "name": "Sarasva",
      "description":
      "A literary club that encourages reading, writing, debates, and discussions, fostering a love for literature."
    },
    {
      "name": "Informal",
      "description":
      "A literary club that encourages reading, writing, debates, and discussions, fostering a love for literature."
    },
    {
      "name": "Main Stage",
      "description":
      "A literary club that encourages reading, writing, debates, and discussions, fostering a love for literature."
    },
  ];

  List<String> imageUrls = [
    "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/cover%20page%2Fams%2FScreenshot%202024-10-23%20031440.png?alt=media&token=38a45e84-6e10-4179-b404-6cf9a281c0a0",
    "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/cover%20page%2FgeneticX%2F53119356397_4b9ba6d9e2_o.jpg?alt=media&token=22b3e698-312c-40bc-80a9-863d31a3adbd",
    "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/cover%20page%2Fnirmiti%2F53652925228_b28ccb3b24_o.jpg?alt=media&token=6ecb4670-563e-4a38-a4e3-6e449be01b2d",
    "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/cover%20page%2Frangtarangini%2Fcover%20rang.jpg?alt=media&token=8add05a3-fb9a-4659-a15f-56e8a7f78539",
    "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/cover%20page%2Fvirtuosi%2F53125815465_ca3b4e2ab6_o.jpg?alt=media&token=a87f1474-d20a-4216-950f-113fc4d2573c",
    "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/cover%20page%2Fsarsva%2Fcover%20sarasva.jpg?alt=media&token=e9f9bed9-14ff-4260-a1ca-8f6bc4c13724",
    "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Main%20Stage%2FAlaMode%2FScreenshot%202024-10-17%20212502.png?alt=media&token=8773e1d7-b287-4f92-a3b6-41c455e38d91",
    "https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Main%20Stage%2Fpexels-teddy-2263435.jpg?alt=media&token=e57c153a-f73f-4f52-a07f-9907d376b93e"
  ];



  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double childAspectRatio = screenWidth / (screenHeight / 1.7);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B150E),
        title: Text(
          "Events",
          style: GoogleFonts.dmSans(
            textStyle: const TextStyle(
              fontSize: 28.0,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3B150E), // Light red at the top
              Color(0xFF1A0C08), // Black at the bottom
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: screenWidth > 600 ? 3 : 2,
              crossAxisSpacing: 15.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: childAspectRatio,
            ),
            itemCount: societyList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  log("hello bro  ${societyList[index]["title"]}");
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EventScreen(
                        list: APIs.societyeventslist[index],
                        item: societyList[index]["name"]!,
                      ),
                    ),
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.black,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(16.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 0.0, left: 0.0, right: 0.0),
                          child: Container(
                            child: ClipRRect(
                              child: CachedNetworkImage(
                                imageUrl: imageUrls[index],
                                height: screenHeight * 0.10,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                placeholder: (context, url) => Container(
                                  height: screenHeight * 0.12,
                                  color: Colors.grey[200],
                                  child: Center(
                                    child: LoadingView(height: 60, width: 60),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Container(
                                  height: screenHeight * 0.12,
                                  color: Colors.grey[200],
                                  child: const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0),
                        child: Text(
                          societyList[index]["name"]!,
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                              fontSize: screenWidth * 0.042,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:4.0,right:8.0,left:15.0),
                        child: Text(
                          societyList[index]["description"]!,
                          style: GoogleFonts.dmSans(
                            textStyle: TextStyle(
                              fontSize: screenWidth * 0.0285,
                              color: Colors.white70,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
