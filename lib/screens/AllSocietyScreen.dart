import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavilion/database/Apis.dart';
import 'package:pavilion/screens/event_screen.dart';

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
  ];

  List<String> imageUrls = [
    "https://marketplace.canva.com/EAFFWby_WGo/1/0/1131w/canva-dark-blue-night-club-party-poster-iQT5avxTBQ0.jpg",
    "https://marketplace.canva.com/EAFFWby_WGo/1/0/1131w/canva-dark-blue-night-club-party-poster-iQT5avxTBQ0.jpg",
    "https://marketplace.canva.com/EAFFWby_WGo/1/0/1131w/canva-dark-blue-night-club-party-poster-iQT5avxTBQ0.jpg",
    "https://marketplace.canva.com/EAFFWby_WGo/1/0/1131w/canva-dark-blue-night-club-party-poster-iQT5avxTBQ0.jpg",
    "https://marketplace.canva.com/EAFFWby_WGo/1/0/1131w/canva-dark-blue-night-club-party-poster-iQT5avxTBQ0.jpg",
    "https://marketplace.canva.com/EAFFWby_WGo/1/0/1131w/canva-dark-blue-night-club-party-poster-iQT5avxTBQ0.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    // Get device width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Determine the childAspectRatio dynamically based on screen width and height
    double childAspectRatio = screenWidth / (screenHeight / 1.5); // Adjust as needed

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: screenWidth > 600 ? 3 : 2, // Adjust columns based on screen width
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: childAspectRatio, // Dynamically adjust aspect ratio
          ),
          itemCount: societyList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Navigate to the EventScreen when tapped
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
                      child: CachedNetworkImage(
                        imageUrl: imageUrls[index],
                        height: screenHeight * 0.12, // Adjust height based on screen height
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          height: screenHeight * 0.12,
                          color: Colors.grey[200],
                          child: const Center(
                            child: CircularProgressIndicator(),
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
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        societyList[index]["name"]!,
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontSize: screenWidth * 0.045, // Responsive text size
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        societyList[index]["description"]!,
                        style: GoogleFonts.dmSans(
                          textStyle: TextStyle(
                            fontSize: screenWidth * 0.03, // Responsive text size
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
    );
  }
}
