import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MerchPage extends StatelessWidget {
  final List<Map<String, String>> merchItems = [
    {
      'name': 'College Hoodie',
      'detail': 'Stay cozy with our premium hoodie.',
      'price': '₹999',
      'image': 'assets/images/notification.png',
    },
    {
      'name': 'Custom T-Shirt',
      'detail': 'Show off your spirit with a stylish tee.',
      'price': '₹499',
      'image': 'assets/images/notification.png',
    },
    {
      'name': 'College Mug',
      'detail': 'Start your mornings right with a mug.',
      'price': '₹299',
      'image': 'assets/images/notification.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212), // Matching dark theme
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Merch Store',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: merchItems.length,
          itemBuilder: (context, index) {
            final item = merchItems[index];
            return _buildMerchCard(item).animate().fadeIn(
              duration: 500.ms,
              curve: Curves.easeIn,
            ); // Add animation to each card
          },
        ),
      ),
    );
  }

  Widget _buildMerchCard(Map<String, String> item) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1F1F1F), // Slightly lighter black for contrast
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Merch Image
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                item['image']!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ).animate().scale(
                duration: 300.ms,
                curve: Curves.easeInOut,
              ), // Image scale animation
            ),
            const SizedBox(width: 16.0),

            // Merch Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['name']!,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    item['detail']!,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    item['price']!,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFFBB86FC), // Purple accent matching palette
                    ),
                  ),
                ],
              ),
            ),

            // Buy Button
            ElevatedButton(
              onPressed: () {
                Fluttertoast.showToast(
                  msg: "Please update your info",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.black,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFBB86FC), // Purple accent
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              child: const Text(
                'Buy',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

