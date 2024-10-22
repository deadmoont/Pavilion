import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pavilion/components/loading_view.dart';
import 'package:pavilion/database/Apis.dart';

class PhotowallScreen extends StatefulWidget {
  const PhotowallScreen({super.key});

  @override
  State<PhotowallScreen> createState() => _PhotowallScreenState();
}

class _PhotowallScreenState extends State<PhotowallScreen> {
  List<String> images = [];
  bool isLoading = true;
  final api = APIs();

  @override
  void initState() {
    super.initState();
    _loadPhotoWall();
  }

  Future<void> _loadPhotoWall() async {
    try {
      List<String> fetchedImages = await api.fetchPhotoWall();
      setState(() {
        images = fetchedImages;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
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
          style: GoogleFonts.dmSans(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFF3B150E),
      ),
      body: RefreshIndicator(
        onRefresh: ()async {
           List<String> fetchedImages = await api.fetchPhotoWallFirebase();
      setState(() {
        images = fetchedImages;
      });
        },
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF3B150E), // Light red at the top
                Color(0xFF1A0C08), // Black at the bottom
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 2.0),
            child: isLoading
                ? const Center(child: LoadingView(height: 100, width: 100))
                : images.isEmpty
                ? const Center(child: Text('No images found.'))
                : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: MasonryGridView.builder(
                gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          images[index],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return const Icon(Icons.broken_image);
                          },
                        ),
                      ),
                    ),
                  );
                },
                mainAxisSpacing: 14.0,
                crossAxisSpacing: 14.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
