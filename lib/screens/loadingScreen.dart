import 'package:flutter/material.dart';
import 'package:animate_gradient/animate_gradient.dart';
import 'package:pavilion/screens/DevelopersPage.dart';
import 'package:pavilion/screens/sponsors_page.dart';
import 'package:pavilion/screens/TeamsPage.dart';
import 'package:pavilion/screens/merchScreen.dart';
import 'aboutus_page.dart'; // Ensure you import SponsorPage if it’s used

// This is the loading screen
class Loadingscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // Setting the gradient background
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3B150E), // Light red at the top
              Color(0xFF1A0C08), // Black at the bottom
            ],
          ),
        ),
        child: AnimateGradient(
          primaryBegin: Alignment.topLeft,
          primaryEnd: Alignment.bottomLeft,
          secondaryBegin: Alignment.bottomLeft,
          secondaryEnd: Alignment.topRight,
          primaryColors: const [
            Colors.pink,
            Colors.pinkAccent,
            Colors.white,
          ],
          secondaryColors: const [
            Colors.white,
            Colors.blueAccent,
            Colors.blue,
          ],
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo at the top
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Image.asset(
                  'assets/svgIcons/logo.png',
                  color: Colors.white,
                  height: 50,
                ),
              ),
              // Buttons with ripple effect
              CustomButton(
                icon: Icons.description_outlined,
                text: 'About Us',
                onTap: () {
                  // Action when About Us is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutUsPage()),
                  );
                },
              ),
              CustomButton(
                icon: Icons.group_outlined,
                text: 'Team',
                onTap: () {
                  // Action when Team is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TeamPage()),
                  );
                },
              ),
              CustomButton(
                icon: Icons.handshake_outlined,
                text: 'Sponsors',
                onTap: () {
                  // Action when Sponsors is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SponsorPage()),
                  );
                },
              ),
              CustomButton(
                icon: Icons.question_answer_outlined,
                text: 'Merch',
                onTap: () {
                  // Action when Merch is clicked
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Merchscreen()),
                  );
                },
              ),
              CustomButton(
                icon: Icons.person_outline,
                text: 'Developers',
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => DevelopersPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom button widget for reusability
class CustomButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const CustomButton({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
      child: Material(
        color: Colors.transparent, // Makes sure the background is transparent
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.3), // Dark background with opacity
            borderRadius: BorderRadius.circular(10),
          ),
          child: InkWell(
            onTap: onTap,
            splashColor: Colors.white.withOpacity(0.3), // White ripple effect
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
              child: Row(
                children: [
                  Icon(
                    icon,
                    color: Colors.white,
                    size: 24,
                  ),
                  SizedBox(width: 20),
                  Text(
                    text,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
