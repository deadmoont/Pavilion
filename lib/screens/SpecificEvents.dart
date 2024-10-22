import 'package:flutter/material.dart';
import 'package:pavilion/components/loading_view.dart';
import 'package:pavilion/database/Apis.dart';

class SpecificEvent extends StatefulWidget {
  final String image;
  final String title;
  final String des;
  final String venue;

  const SpecificEvent({super.key, required this.image, required this.title, required this.des, required this.venue});

  @override
  _SpecificEventState createState() => _SpecificEventState();
}

class _SpecificEventState extends State<SpecificEvent> {
  bool _isLoading = false;

  Future<void> _fetchParticipants() async {
    setState(() {
      _isLoading = true; // Start the loader
    });

    try {
      await APIs.test();
    } catch (e) {
      // Handle any errors if needed
    } finally {
      setState(() {
        _isLoading = false; // Stop the loader
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Top Background Image (half screen)
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.5, // Cover top half
            child: Stack(
              children: [
                Image.network(
                  widget.image,
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child; // Image is fully loaded
                    } else {
                      // While the image is loading, return an empty container
                      return Container(
                        child: const Center(
                          child: LoadingView(height: 60, width: 60), // Show loading indicator while the image is loading
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),

          // Bottom Black Background (half screen)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Colors.black,
            ),
          ),
          // Back button and icons
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black54, // Black with some transparency
                      borderRadius: BorderRadius.circular(50), // Rounded corners (optional)
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    padding: const EdgeInsets.all(4), // Padding inside the button for a larger tap area
                  ),
                ],
              ),
            ),
          ),
          // Event Details Container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Event Title and Date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Time  9:10 PM',
                            style: TextStyle(
                              color: Colors.white54,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Description of the Event
                  Text(
                    'About Event:',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    widget.des,
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  // Location Section
                  Text(
                    'Venue: ${widget.venue}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  // Apply Button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        // Action for applying to the event
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: Text('Apply for Event', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
