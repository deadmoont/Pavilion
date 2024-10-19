import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';  // Import Google Fonts
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
        title: Text(
          'Photo Wall',
          style: GoogleFonts.dmSans(  // Apply DM Sans font
            color: Colors.white,       // Set text color to white
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false, // Align the title to the left
        backgroundColor: Colors.black,  // Set the background color of the AppBar to black
      ),
      backgroundColor: Colors.black,  // Set the background color of the scaffold to black
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),  // Add horizontal and vertical padding
        child: isLoading
            ? const Center(child: CircularProgressIndicator())  // Show a loader while fetching data
            : images.isEmpty
            ? const Center(child: Text('No images found.'))  // Handle case where there are no images
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),  // Add horizontal padding around the photo list
                child: MasonryGridView.builder(
                  gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: images.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),  // Apply rounded corners to the container and image
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 2.0),  // Add white border to the images
                          borderRadius: BorderRadius.circular(12.0),  // Ensure rounded corners
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),  // Apply rounded corners inside the container
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,  // Ensure the image fits properly
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(Icons.broken_image);  // Handle error in case of a broken URL
                            },
                          ),
                        ),
                      ),
                    );
                  },
                  mainAxisSpacing: 14.0,  // Space between tiles vertically
                  crossAxisSpacing: 14.0,  // Space between tiles horizontally
                ),
              ),
      ),
    );
  }
}
