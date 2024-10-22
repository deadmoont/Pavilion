import 'dart:convert';
import 'dart:developer'; // For log()
import 'package:flutter/material.dart';
import '../components/MyListTile.dart'; // Assuming MyListTile is correctly imported
import '../components/loading_view.dart';
import '../database/Apis.dart'; // Import your API class with fetchTimeLine method
import 'package:intl/intl.dart'; // For timestamp formatting

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
    List<Map<String, Map<String, Map<String, String>>>> temp = await api.fetchTimeLine();

    // Log the fetched data for debugging
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
      body: isLoading
          ? const Center(child: CircularProgressIndicator()) // Show loading while fetching
          : Container(
              height: MediaQuery.of(context).size.height,
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
                padding: const EdgeInsets.all(15),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 
                      30,),
                      const Text(
                        "Timeline",
                        style: TextStyle(fontSize: 32, color: Colors.white,fontWeight: FontWeight.bold),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: timeline.length,
                        itemBuilder: (context, dayIndex) {
                          String day = timeline[dayIndex].keys.first;
                          Map<String, Map<String, String>> events = timeline[dayIndex][day] ?? {};

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 30),
                              Center(
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
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
                                shrinkWrap: true, // Important to prevent ListView height issues
                                itemCount: events.length,
                                itemBuilder: (context, eventIndex) {
                                  String eventKey = events.keys.elementAt(eventIndex);
                                  Map<String, String>? event = events[eventKey];

                                  return MyListTile(
                                    isFirst: eventIndex == 0,
                                    isLast: eventIndex == events.length - 1,
                                    name: event?['name'] ?? '',
                                    venue: event?['venue'] ?? '',
                                    timestamp: "12:00" // Format to hh-mm (12-hour)
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
