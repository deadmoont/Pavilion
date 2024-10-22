import 'package:pavilion/components/SocietyCard.dart';
import 'package:pavilion/components/Society_Carousel.dart';
import 'package:pavilion/components/custom_carousel.dart';
import 'package:pavilion/components/movie_card_widget.dart';
import 'package:pavilion/database/Apis.dart';
import 'package:pavilion/models/artists.dart';
import 'package:pavilion/models/events.dart';
import 'package:pavilion/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../components/loading_view.dart'; // Import Google Fonts

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Artists>> artistDataFuture; // Declare a future variable to hold artist data
  late Future<List<Events>> eventsDataFuture;
  List<String> societylist = [
    "AMS",
    "GeneticX",
    "Nirmiti",
    "Rangtarangini",
    "Virtuosi",
    "sarasva"
  ];

  @override
  void initState() {
    super.initState();
    artistDataFuture = APIs.fetchArtistData(); // Initialize the future in initState
    eventsDataFuture = APIs.fetcheventsData();
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
              Color(0xFF3B150E), // Light red at the top
              Color(0xFF1A0C08), // Black at the bottom
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 130),
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
                    return CustomCarouselSlider(
                        data: snapshot.data!); // Pass the data to the carousel slider
                  }
                  return const SizedBox(); // Return an empty box if there's no data
                },
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0), // Align text to the left
                  child: Text(
                    "Events",
                    style: GoogleFonts.spaceGrotesk(
                      // Use Space Grotesk font
                      color: const Color(0xFFFAFAFA), // Set color to FAFAFA
                      fontSize: 30, // Reduce font size slightly
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              FutureBuilder<List<Events>>(
                future: eventsDataFuture, // Use the initialized future
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: LoadingView(height: 60, width: 60));
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (snapshot.hasData) {
                    return MovieCardWidget(
                        data: snapshot.data!,
                        delay: 1200,
                        rev: false); // Pass the data to the carousel slider
                  }
                  return const SizedBox(); // Return an empty box if there's no data
                },
              ),
              const SizedBox(height: 10),
              FutureBuilder<List<Events>>(
                future: eventsDataFuture, // Use the initialized future
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: LoadingView(height: 60, width: 60));
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (snapshot.hasData) {
                    return MovieCardWidget(
                        data: snapshot.data!,
                        delay: 2000,
                        rev: true); // Pass the data to the carousel slider
                  }
                  return const SizedBox(); // Return an empty box if there's no data
                },
              ),
              const SizedBox(height: 20), // Added some spacing for clarity
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0), // Align text to the left
                  child: Text(
                    "Society Events",
                    style: GoogleFonts.spaceGrotesk(
                      // Use Space Grotesk font
                      color: const Color(0xFFFAFAFA), // Set color to FAFAFA
                      fontSize: 30, // Reduce font size slightly
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SocietyCarousel(data: societylist),
            ],
          ),
        ),
      ),
    );
  }
}
