import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pavilion/components/loading_view.dart';
import 'package:pavilion/database/Apis.dart';
import 'package:url_launcher/url_launcher.dart';

class SpecificEvent extends StatefulWidget {
  final String image;
  final String title;
  final String des;
  final String venue;
  final String form;

  const SpecificEvent({super.key, required this.image, required this.title, required this.des, required this.venue,required this.form});

  @override
  _SpecificEventState createState() => _SpecificEventState();
}

class _SpecificEventState extends State<SpecificEvent> {
  bool _isLoading = false;

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);

    // Use launchUrl directly to attempt opening the URL
    try {
      bool launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Opens in an external browser/app
      );
      if (!launched) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error: $e');
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
                          // Show toast message if link is not available
                          if(widget.form==""){
                              Fluttertoast.showToast(
                              msg: "Link not available", // Toast message
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.brown, // Background color of the toast
                              textColor: Colors.white, // Text color of the toast
                            );
                          }
                          else{
                            _launchURL(widget.form);
                          }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      child: Text(
                        'Apply for Event',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
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
