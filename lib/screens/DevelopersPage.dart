import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore

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

  // Fetch developers from Firestore
  Future<void> fetchDevelopers() async {
    try {
      final QuerySnapshot snapshot = await FirebaseFirestore.instance.collection('Developers').get();
      final List<Map<String, dynamic>> tempHeads = [];
      final List<Map<String, dynamic>> tempExecutives = [];
      final List<Map<String, dynamic>> tempVolunteers = [];

      for (var doc in snapshot.docs) {
        final data = doc.data() as Map<String, dynamic>;
        if (data['type'] == 'head') {
          tempHeads.add(data);
        } else if (data['type'] == 'executive') {
          tempExecutives.add(data);
        }else if (data['type'] == 'volunteers') {
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
          ? Container(child: Center(child: CircularProgressIndicator())) // Show loading indicator
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

  // Dynamic profile card builder
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
            CircleAvatar(
              radius: 60, // Further increased the size of the avatar
              backgroundColor: Colors.yellowAccent,
              child: CircleAvatar(
                radius: 58,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18, // Increased font size
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
