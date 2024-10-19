import 'package:pavilion/components/SocietyCard.dart';
import 'package:pavilion/components/Society_Carousel.dart';
import 'package:pavilion/components/custom_carousel.dart';
import 'package:pavilion/components/movie_card_widget.dart';
import 'package:pavilion/database/Apis.dart';
import 'package:pavilion/models/artists.dart';
import 'package:pavilion/models/events.dart';
import 'package:pavilion/utils/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Artists>> artistDataFuture; // Declare a future variable to hold artist data
  late Future<List<Events>> eventsDataFuture;
  List<String> societylist = ["AMS" , "GeneticX" , "Nirmiti" , "Rangtarangini" , "Virtuosi" , "sarasva"];

  @override
  void initState() {
    super.initState();
    artistDataFuture = APIs.fetchArtistData(); // Initialize the future in initState
    eventsDataFuture = APIs.fetcheventsData();
    APIs.fetchSocietyData();// Initialize the future in initState
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.BLACK,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            FutureBuilder<List<Artists>>(
              future: artistDataFuture, // Use the initialized future
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.hasData) {
                  return CustomCarouselSlider(data: snapshot.data!); // Pass the data to the carousel slider
                }
                return const SizedBox(); // Return an empty box if there's no data
              },
            ),
            const SizedBox(height: 20),
            Text(
              "Events",
              style: TextStyle(
                color: Color(0xFFF802AC),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 20,
              // child: MovieCardWidget(),
            ),
            FutureBuilder<List<Events>>(
              future: eventsDataFuture, // Use the initialized future
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.hasData) {
                  return MovieCardWidget(data: snapshot.data!, delay: 1200, rev: false,); // Pass the data to the carousel slider
                }
                return const SizedBox(); // Return an empty box if there's no data
              },
            ),
            const SizedBox(height: 10),
            FutureBuilder<List<Events>>(
              future: eventsDataFuture, // Use the initialized future
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (snapshot.hasData) {
                  return MovieCardWidget(data: snapshot.data!, delay: 2000, rev: true,); // Pass the data to the carousel slider
                }
                return const SizedBox(); // Return an empty box if there's no data
              },
            ),
            const SizedBox(height: 20), // Added some spacing for clarity
            Text(
              "Society Events",
              style: TextStyle(
                color: Color(0xFFF802AC),
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            SocietyCarousel(data: societylist)
          ],
        ),
      ),
    );
  }
}