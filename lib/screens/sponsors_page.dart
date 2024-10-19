import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Make sure to import Firestore
import '../components/sponsor_card.dart';
import '../database/Apis.dart';
import '../models/sponsors.dart'; // Assuming the Sponsors class is in this path

class SponsorPage extends StatefulWidget {
  @override
  _SponsorPageState createState() => _SponsorPageState();
}

class _SponsorPageState extends State<SponsorPage> {
  // Update the fetchSponsors method to return a Future<List<Sponsors>>
  static Future<List<Sponsors>> fetchSponsors() async {
    final api = APIs();
    return api.fetchSponsors();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          'Sponsors',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<List<Sponsors>>(
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
    );
  }
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
        color: Color(0xFF2C2F48), // Background color similar to the image
        borderRadius: BorderRadius.circular(10), // Rounded corners for the card
        border: Border.all(
          color: Colors.white.withOpacity(0.1), // Slightly transparent white border
          width: 1.5, // Thickness of the border
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo container with borderRadius
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20), // Border radius for the image itself
              image: DecorationImage(
                image: NetworkImage(logo), // NetworkImage or AssetImage for logos
                fit: BoxFit.contain, // Ensures the logo is well-contained
              ),
            ),
          ),
          SizedBox(width: 20), // Spacing between logo and text
          // Sponsor Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
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