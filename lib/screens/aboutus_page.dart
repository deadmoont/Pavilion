import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // For launching URLs

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/splash_background.jpg'),
          //       fit: BoxFit.cover,
          //     ),
          //   ),
          // ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                  SizedBox(height: 20),
                  Text(
                    "About Us",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 72,
                    height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    child: Image.asset('assets/svgIcons/logo.png'),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Nationally acknowledged for its array of unforgettable evenings, EFFERVESCENCE is the once in a year cultural epitome of IIITA illuminating the essence and ethos of IIITA witnessing a footfall of 21k+ per year.Effervesence has made a name for itself for the phenomenally successful online versions of the fest due to generous views and comments during the talk shows, comedy gigs and body-grooving musical performances. Each event reaches a different ke audience segment and provides a fun, entertaining and engaging way to wow the audience.",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 30),
                  Text(
                    "Contact Us",
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialMediaIcon(
                        image: 'assets/images/gmail.png',
                        onTap: () {
                          _launchURL('mailto:effervescence@gmail.com');
                        },
                      ),
                      SocialMediaIcon(
                        image: 'assets/images/instagram.png',
                        onTap: () {
                          _launchURL(
                              'https://www.instagram.com/goeffervescence/');
                        },
                      ),
                      SocialMediaIcon(
                        image: 'assets/images/facebook.png',
                        onTap: () {
                          _launchURL('https://www.facebook.com/example');
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _launchURL(String url) async {
    Uri uri = Uri.parse(url);

    if (await canLaunchUrl(uri)) {
      await launchUrl(
        uri,
        mode: LaunchMode.externalApplication, // Ensures it opens in an external app
      );
      print('launching $url');
    } else {
      print('Could not launch $url');
      // Show a user-friendly error message if necessary
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 2),
          ),
          child: Image.asset(image),
        ),
      ),
    );
  }
}
