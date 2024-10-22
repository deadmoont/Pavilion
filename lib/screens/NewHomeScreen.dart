import 'package:flutter/material.dart';
import 'package:pavilion/components/NewCustom_Carousel.dart';
import 'package:pavilion/components/NewSocietyCarousel.dart';
import '../components/loading_view.dart';
import '../database/Apis.dart';
import '../models/artists.dart';
import '../models/events.dart';

class NewHomeScreen extends StatefulWidget {
  const NewHomeScreen({super.key});

  @override
  State<NewHomeScreen> createState() => _NewHomeScreenState();
}

class _NewHomeScreenState extends State<NewHomeScreen> {
  List<int> color = [0,0,0];
  late Future<List<Artists>>
  artistDataFuture; // Declare a future variable to hold artist data
  late Future<List<Events>> eventsDataFuture;
  List<Map<String, String>> societylist = [
    {
      "name": "AMS",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%202%20(1).png?alt=media&token=fdc4e5e7-94b5-4d86-8aed-957d5bd05ed9"
    },
    {
      "name": "GeneticX",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%203%20(1).png?alt=media&token=6b3df03e-add3-4320-bee6-c6af632dbc5d"
    },
    {
      "name": "GeneticX",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%203%20(1).png?alt=media&token=6b3df03e-add3-4320-bee6-c6af632dbc5d"
    },
    {
      "name": "Nirmiti",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%203%20(1).png?alt=media&token=6b3df03e-add3-4320-bee6-c6af632dbc5d"
    },
    {
      "name": "Rangtarangini",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%203%20(1).png?alt=media&token=6b3df03e-add3-4320-bee6-c6af632dbc5d"
    },
    {
      "name": "Virtuosi",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%203%20(1).png?alt=media&token=6b3df03e-add3-4320-bee6-c6af632dbc5d"
    },
    {
      "name": "sarasva",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%203%20(1).png?alt=media&token=6b3df03e-add3-4320-bee6-c6af632dbc5d"
    },
  ];
  final List<Map<String, String>> events = [
    {
      "name": "Effe'24",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%202%20(1).png?alt=media&token=fdc4e5e7-94b5-4d86-8aed-957d5bd05ed9"
    },
    {
      "name": "Antaragni",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%203%20(1).png?alt=media&token=6b3df03e-add3-4320-bee6-c6af632dbc5d"
    },
  ];

  final List<Map<String, String>> planned = [
    {
      "name": "Effe'24",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%202%20(1).png?alt=media&token=fdc4e5e7-94b5-4d86-8aed-957d5bd05ed9"
    },
    {
      "name": "Antaragni",
      "image": "https://firebasestorage.googleapis.com/v0/b/fffc-5725a.appspot.com/o/image%203%20(1).png?alt=media&token=6b3df03e-add3-4320-bee6-c6af632dbc5d"
    },
  ];

  @override
  void initState() {
    super.initState();
    artistDataFuture =
        APIs.fetchArtistData(); // Initialize the future in initState
    eventsDataFuture = APIs.fetcheventsDataFirebase();
    APIs.fetchSocietyData(); // Initialize the future in initState
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFFF5F52), // Light red at the top
              Color(0xFF000000), // Black at the bottom
            ],
          ),
        ),
        child: Stack(
          children: [
            // Positioned search bar at the top
            Positioned(
              top: 70,
              left: 16,
              right: 76,
              child: Opacity(
                opacity: 0.5,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.search, color: Colors.grey[700]),
                      hintText: "Search all events",
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ),
              ),
            ),
            // IconButton for filter (Positioned next to search bar)
            Positioned(
              top: 70,
              right: 16,
              child: IconButton(
                icon: const Icon(Icons.filter_alt_outlined, size: 36, color: Colors.white),
                onPressed: () {
                  // Filter button logic here
                },
              ),
            ),
            Positioned(
              top: 150,
              right: 16,
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("All Categories", style: TextStyle(color: Colors.white, fontSize: 15)),
                    const Text("View all", style: TextStyle(color: Colors.white, fontSize: 15)),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 190,
              left: 16,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Tile(Icon(Icons.star, color: Colors.white), "Today",0),
                    SizedBox(width: 10,),
                    Tile(Icon(Icons.star, color: Colors.white), "Sport",1),
                    SizedBox(width: 10,),
                    Tile(Icon(Icons.star, color: Colors.white), "Concert",2),

                    // Add more tiles as needed
                  ],
                ),
              ),
            ),
            // Carousel and Event listings
            Positioned(
              top: 260,
              left: 16,
              right: 16,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder<List<Artists>>(
                    future: artistDataFuture, // Use the initialized future
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: LoadingView(height: 80, width: 80));
                      }
                      if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      }
                      if (snapshot.hasData) {
                        return NewCustomCarousel(
                            data: snapshot
                                .data!); // Pass the data to the carousel slider
                      }
                      return const SizedBox(); // Return an empty box if there's no data
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Planned",
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 200, // Define height for the ListView
                    child: NewSocietyCarousel(data: societylist)
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final String imageUrl;
  final String title;

  const EventCard({
    Key? key,
    required this.imageUrl,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Adjust card width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: NetworkImage(imageUrl), // Use NetworkImage for URL
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 10,
            left: 10,
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: const Icon(Icons.bookmark_border, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

Widget Tile(Icon icon, String title,int i) {
  return Container(
    padding: const EdgeInsets.all(8.0), // Add padding around the tile
    decoration: BoxDecoration(
      color: Colors.redAccent.withOpacity(0.5), // Set background color
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 4,
          offset: const Offset(0, 2), // Adjust shadow position
        ),
      ],
    ),
    child: Row(
      children: [
        icon, // Place the icon directly
        const SizedBox(width: 8), // Add space between icon and text
        Text(
          title,
          style: const TextStyle(
            fontSize: 16, // Adjust font size
            fontWeight: FontWeight.w500, // Set font weight
          ),
        ),
      ],
    ),
  );
}