import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pavilion/database/Apis.dart';  // Import the APIs class

class PhotowallScreen extends StatefulWidget {
  const PhotowallScreen({super.key});

  @override
  State<PhotowallScreen> createState() => _PhotowallScreenState();
}

class _PhotowallScreenState extends State<PhotowallScreen> {
  List<String> images = [];
  bool isLoading = true;  // Add a loading state

  @override
  void initState() {
    super.initState();
    _loadPhotoWall();
  }

  Future<void> _loadPhotoWall() async {
    try {
      // Fetch the images from Firestore
      List<String> fetchedImages = await APIs.fetchPhotoWall();
      setState(() {
        images = fetchedImages;
        isLoading = false;  // Set loading state to false after data is fetched
      });
    } catch (e) {
      setState(() {
        isLoading = false;  // Handle error by disabling the loader
      });
      print('Error loading photo wall: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Wall'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: isLoading
            ? const Center(child: CircularProgressIndicator())  // Show a loader while fetching data
            : images.isEmpty
            ? const Center(child: Text('No images found.'))  // Handle case where there are no images
            : MasonryGridView.builder(
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: images.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                images[index],
                fit: BoxFit.fitHeight,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.broken_image);  // Handle error in case of a broken URL
                },
              ),
            );
          },
          mainAxisSpacing: 14.0,  // Space between tiles vertically
          crossAxisSpacing: 14.0,  // Space between tiles horizontally
        ),
      ),
    );
  }
}
