import 'package:flutter/material.dart';

// this iwthe loadign cren 

class Loadingscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // Adding gradient background
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF6A00F4),
              Color(0xFF9C00FF),
              Color(0xFF15002B),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo at the top
            Padding(
              padding: const EdgeInsets.only(bottom: 40.0),
              child: Image.network(
                'https://example.com/logo.png', // Replace with actual logo URL
                height: 150,
              ),
            ),
            // Buttons with ripple effect
            CustomButton(
              icon: Icons.description_outlined,
              text: 'About Us',
              onTap: () {
                // Action when About Us is clicked
              },
            ),
            CustomButton(
              icon: Icons.group_outlined,
              text: 'Team',
              onTap: () {
                // Action when Team is clicked
              },
            ),
            CustomButton(
              icon: Icons.handshake_outlined,
              text: 'Sponsors',
              onTap: () {
                // Action when Sponsors is clicked
              },
            ),
            CustomButton(
              icon: Icons.question_answer_outlined,
              text: 'FAQs',
              onTap: () {
                // Action when FAQs is clicked
              },
            ),
            CustomButton(
              icon: Icons.person_outline,
              text: 'Developers',
              onTap: () {
                // Action when Developers is clicked
              },
            ),
          ],
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
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.white.withOpacity(0.3), // White ripple effect
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            color:
                Colors.black.withOpacity(0.3), // Dark background with opacity
            borderRadius: BorderRadius.circular(10),
          ),
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
    );
  }
}