import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
      "description": "A society dedicated to capturing moments through the lens, focusing on photography and videography."
    },
    {
      "name": "GeneticX",
      "description": "A dynamic dance group that explores various dance forms and promotes self-expression through movement."
    },
    {
      "name": "Nirmiti",
      "description": "A creative club for fine arts enthusiasts, nurturing skills in painting, sketching, and other artistic expressions."
    },
    {
      "name": "Rangtarangini",
      "description": "A drama society that brings stories to life through acting, theater performances, and stage plays."
    },
    {
      "name": "Virtuosi",
      "description": "A music group that celebrates the art of sound, providing a platform for singers, instrumentalists, and music lovers."
    },
    {
      "name": "Sarasva",
      "description": "A literary club that encourages reading, writing, debates, and discussions, fostering a love for literature."
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
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          "Society",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
            childAspectRatio: 0.8, // Adjusted for a better aspect ratio
          ),
          itemCount: societyList.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                // Navigate to the EventScreen when the container is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EventScreen(list: APIs.societyeventslist[index], item: societyList[index]["name"]!), // Replace with your EventScreen widget
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
                        height: 100,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          height: 100,
                          color: Colors.grey[200],
                          child: const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: 100,
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
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        societyList[index]["name"]!,
                        style: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        societyList[index]["description"]!,
                        style: const TextStyle(
                          fontSize: 12.0,
                          color: Colors.white70,
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
