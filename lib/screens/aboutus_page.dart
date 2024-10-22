import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // For launching URLs

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get screen size for responsiveness
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Container for gradient background
          Container(
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
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                const SizedBox(width: 20,),
                Text(
                  "About Us",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: screenHeight * 0.03, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  ],
                ),
                // SizedBox(height: screenHeight * 0.02), // Responsive spacing
                // Responsive spacing
                
                SizedBox(height: screenHeight * 0.04), // Responsive spacing
                Container(
                  width: screenWidth * 0.3,
                  height: screenWidth * 0.3, // Ensure it's circular by using width and height equally
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Image.asset('assets/images/notification.png',height: 60,),
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: Text(
                    "Nationally acknowledged for its array of unforgettable evenings, EFFERVESCENCE is the once in a year cultural epitome of IIITA illuminating the essence and ethos of IIITA witnessing a footfall of 21k+ per year. Effervesence has made a name for itself for the phenomenally successful online versions of the fest due to generous views and comments during the talk shows, comedy gigs, and body-grooving musical performances. Each event reaches a different key audience segment and provides a fun, entertaining, and engaging way to wow the audience.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: screenHeight * 0.02, // Responsive font size
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive spacing
                Text(
                  "Contact Us",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Colors.white,
                    fontSize: screenHeight * 0.04, // Responsive font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialMediaIcon(

                      image: 'assets/images/gmail.png',
                      onTap: () {
                        _launchURL('mailto:effervescence@iiita.ac.in');
                      },
                    ),
                    SocialMediaIcon(
                      image: 'assets/images/instagram.png',
                      onTap: () {
                        _launchURL('https://www.instagram.com/goeffervescence/');
                      },
                    ),
                    SocialMediaIcon(
                      image: 'assets/images/facebook.png',
                      onTap: () {
                        _launchURL('https://www.facebook.com/effervescence.iiita/');
                      },
                    ),
                  ],
                ),
                Spacer(), // Pushes content to the top and leaves space at the bottom
              ],
            ),
          ),
        ],
      ),
    );
  }

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
}

class SocialMediaIcon extends StatelessWidget {
  final String image;
  final VoidCallback onTap;

  const SocialMediaIcon({
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: screenWidth * 0.13, // Responsive size for icons
          height: screenWidth * 0.13,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Image.asset(image),
          ),
        ),
      ),
    );
  }
}
