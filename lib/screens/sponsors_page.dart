import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Make sure to import Firestore
import '../components/loading_view.dart';
import '../components/sponsor_card.dart';
import '../database/Apis.dart';
import '../models/sponsors.dart'; // Assuming the Sponsors class is in this path

class SponsorPage extends StatefulWidget {
  @override
  _SponsorPageState createState() => _SponsorPageState();
}

class _SponsorPageState extends State<SponsorPage> {
  static Future<List<Sponsors>> fetchSponsors() async {
    final api = APIs();
    return api.fetchSponsors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back ,color: Colors.white,)),
        title: Text(
          'Sponsors',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: Color(0xFF3B150E),
        elevation: 0,
      ),
      body: Container(
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
        child: FutureBuilder<List<Sponsors>>(
          future: fetchSponsors(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error fetching sponsors'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return Center(child: Text('No sponsors available'));
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                // Accessing Sponsors object properties
                Sponsors sponsor = snapshot.data![index];
                return SponsorCard(
                  logo: sponsor.image, // Make sure to include a logo property in Sponsors
                  name: sponsor.name,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

Widget _buildPlaceholder() {
  return Container(
    height: 250,
    decoration: BoxDecoration(
      color: Colors.grey[300], // Background color
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Image.asset(
        'assets/images/placeholder.png',
        fit: BoxFit.cover,
      ),
    ),
  );
}

class SponsorCard extends StatelessWidget {
  final String logo;
  final String name;

  const SponsorCard({
    required this.logo,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF3D0101).withOpacity(0.3), // Background color similar to the image
        borderRadius: BorderRadius.circular(10), // Rounded corners for the card
        border: Border.all(
          color: Colors.white.withOpacity(0.8), // Slightly transparent white border
          width: 1.5, // Thickness of the border
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo container with borderRadius
          Container(
            width: 150,
            height: 120,
            decoration: BoxDecoration(
              color: Color(0xFF3D0101).withOpacity(0.3),
              borderRadius: BorderRadius.circular(20), // Border radius for the image itself
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20), // Clip the image to match the container's border radius
              child: Image.network(
                logo, // The URL for the logo
                fit: BoxFit.contain, // Ensures the logo is well-contained
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) {
                    return child; // Image loaded successfully
                  }
                  return _buildPlaceholder(); // Shimmer placeholder while loading
                },
              ),
            ),
          ),

          SizedBox(width: 20), // Spacing between logo and text
          // Sponsor Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
