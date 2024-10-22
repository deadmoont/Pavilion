import 'dart:convert';
import 'dart:developer'; // Make sure to import this for log()
import 'package:flutter/material.dart';
import '../components/MyListTile.dart'; // Assuming MyListTile is correctly imported
import '../components/loading_view.dart';
import '../database/Apis.dart'; // Import your API class with fetchTimeLine method

class Timeline extends StatefulWidget {
  const Timeline({super.key});

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<Map<String, Map<String, Map<String, String>>>> timeline = [];
  bool isLoading = true;
  final api = APIs();

  @override
  void initState() {
    super.initState();
    fetch();
  }

  void fetch() async {
    // Fetch data from Firebase via your API
    List<Map<String, Map<String, Map<String, String>>>> temp = await api
        .fetchTimeLine();

    // Log the fetched data to debug
    log("Fetched timeline: ${jsonEncode(temp)}");

    setState(() {
      timeline = temp;
      isLoading = false;
    });

    // Log after setting the state to ensure it's updated correctly
    log("Timeline set: ${jsonEncode(timeline)}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      //   backgroundColor: Colors.black,
      //   title: const Text(
      //     "Time Line",
      //     style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      //   ),
      // ),
      body: isLoading
          ? const Center(child: LoadingView(
          height: 100, width: 100)) // Show loading while fetching
          : Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: ListView.builder(
            itemCount: timeline.length,
            itemBuilder: (context, dayIndex) {
              String day = timeline[dayIndex].keys.first;
              Map<String,
                  Map<String, String>> events = timeline[dayIndex][day] ?? {};

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey[600],
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        day,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    // Important to prevent ListView height issues
                    itemCount: events.length,
                    itemBuilder: (context, eventIndex) {
                      String eventKey = events.keys.elementAt(eventIndex);
                      Map<String, String>? event = events[eventKey];

                      return MyListTile(
                        isFirst: eventIndex == 0,
                        isLast: eventIndex == events.length - 1,
                        image: event?['image'] ??
                            'https://firebasestorage.googleapis.com/v0/b/argon-c1d67.appspot.com/o/College%20logo%2Fiiit_allahabad-removebg-preview.png?alt=media&token=bd59c4b0-219e-4195-81be-1faf2eb33f18',
                        // Provide default if not found
                        name: event?['name'] ?? '',
                        venue: event?['venue'] ?? '',
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}