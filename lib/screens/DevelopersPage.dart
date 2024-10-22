import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pavilion/components/loading_view.dart'; // Import Firestore

class DevelopersPage extends StatefulWidget {
  const DevelopersPage({super.key});

  @override
  State<DevelopersPage> createState() => _DevelopersPageState();
}

class _DevelopersPageState extends State<DevelopersPage> {
  List<Map<String, dynamic>> heads = [];
  List<Map<String, dynamic>> executives = [];
  List<Map<String, dynamic>> volunteers = [];
  bool isLoading = true; // State to track if data is still loading

  @override
  void initState() {
    super.initState();
    fetchDevelopers();
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
  // Fetch developers from Firestore
  Future<void> fetchDevelopers() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Developers').get();
      final List<Map<String, dynamic>> tempHeads = [];
      final List<Map<String, dynamic>> tempExecutives = [];
      final List<Map<String, dynamic>> tempVolunteers = [];

      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        if (data['type'] == 'Head') {
          tempHeads.add(data);
        } else if (data['type'] == 'Executive') {
          tempExecutives.add(data);
        }else if (data['type'] == 'Volunteers') {
          tempVolunteers.add(data);
        }
      }

      setState(() {
        heads = tempHeads;
        executives = tempExecutives;
        volunteers=tempVolunteers;
        isLoading = false; // Data has been fetched, so stop loading
      });
    } catch (e) {
      print('Error fetching developers: $e');
      setState(() {
        isLoading = false; // Stop loading even if there is an error
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF3B150E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3B150E),
        title: const Text(
          'Developers',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: isLoading
          ? Container(child: Center(child: LoadingView(height: 100, width: 100))) // Show loading indicator
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (heads.isNotEmpty) ...[
                  const SizedBox(height: 10),
                  const Text(
                    'Heads',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  buildGrid(heads),
                ],
                const SizedBox(height: 20),
                if (executives.isNotEmpty) ...[
                  const Text(
                    'Executives',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  buildGrid(executives),
                ],
                const SizedBox(height: 20),
                if (volunteers.isNotEmpty) ...[
                  const Text(
                    'Volunteers',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  buildGrid(volunteers),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build grid for heads and executives
  Widget buildGrid(List<Map<String, dynamic>> items) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(), // Disable grid scrolling
      shrinkWrap: true,
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Changed to 2 items per row for larger card size
        childAspectRatio: 0.85, // Increased aspect ratio to make the cards bigger
        crossAxisSpacing: 8, // Add space between the grid items horizontally
        mainAxisSpacing: 6, // Add space between the grid items vertically
      ),
      itemBuilder: (context, index) {
        return buildProfileCard(
          name: items[index]['name'],
          imageUrl: items[index]['image'],
        );
      },
    );
  }

  Widget buildProfileCard({
    required String name,
    required String imageUrl,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 150, // Increased width for larger profile cards
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child:
                CircleAvatar(
                  radius: 60, // Outer size of the avatar
                  backgroundColor: Colors.yellowAccent,
                  child: CircleAvatar(
                    radius: 58,
                    backgroundColor: Colors.brown[200], // Background color for avatar
                    child: ClipOval(
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        width: 116, // Ensure the width equals twice the radius
                        height: 116, // Same height for a circular image
                        loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                          if (loadingProgress == null) {
                            // Image fully loaded, show the image
                            return child;
                          } else {
                            // Image is still loading, show the placeholder
                            return Image.asset(
                              'assets/images/placeholder.png',
                              width: 116,
                              height: 116,
                              fit: BoxFit.cover,
                            );
                          }
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.error,
                            color: Colors.red,
                            size: 50,
                          ); // Show error icon if the image fails to load
                        },
                      ),
                    ),
                  ),
                ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18, // Increased font size
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
