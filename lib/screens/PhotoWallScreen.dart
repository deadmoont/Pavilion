import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class PhotowallScreen extends StatefulWidget {
  const PhotowallScreen({super.key});

  @override
  State<PhotowallScreen> createState() => _PhotowallScreenState();
}

class _PhotowallScreenState extends State<PhotowallScreen> {
  final List<String> images = [
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBo_hxkL6C5m9d96gh9JZJ0If3PT0q5yTjkg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqC7j7-8EKhxjYGMGQonJpc-FbmeEg-pxaMg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt6uKMUwrXJLWmamH-DOA-9l9gZw4HSfxDWw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_1CYWYLzwi96E848CtZmbgUz9laH3Yw2QsA&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBo_hxkL6C5m9d96gh9JZJ0If3PT0q5yTjkg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqC7j7-8EKhxjYGMGQonJpc-FbmeEg-pxaMg&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRt6uKMUwrXJLWmamH-DOA-9l9gZw4HSfxDWw&s',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_1CYWYLzwi96E848CtZmbgUz9laH3Yw2QsA&s',
    // Add more URLs of images
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Photo Wall'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // Refresh or other action
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MasonryGridView.builder(
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
              ),
            );
          },
          mainAxisSpacing: 8.0, // Space between tiles vertically
          crossAxisSpacing: 8.0, // Space between tiles horizontally
        ),
      ),
    );
  }
}
