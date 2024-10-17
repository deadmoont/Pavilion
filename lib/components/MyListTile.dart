import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class MyListTile extends StatefulWidget {
  final bool isFirst;
  final bool isLast;
  const MyListTile({
    super.key,
    required this.isFirst,
    required this.isLast,
  });

  @override
  _MyListTileState createState() => _MyListTileState();
}

class _MyListTileState extends State<MyListTile> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller and animation
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500), // Animation duration
      vsync: this,
    );

    // Define the slide transition (from left to right)
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(-1.0, 0.0), // Start from the left (off-screen)
      end: Offset.zero, // Slide into its normal position
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut, // Smooth animation curve
    ));

    // Start the animation when the widget is built
    _controller.forward();
  }

  @override
  void dispose() {
    // Dispose the controller when no longer needed
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120, // Slightly taller for a better layout
      child: SlideTransition(
        position: _offsetAnimation, // Apply the slide animation
        child: TimelineTile(
          isFirst: widget.isFirst,
          isLast: widget.isLast,
          beforeLineStyle: const LineStyle(color: Colors.deepPurple),
          indicatorStyle: const IndicatorStyle(
            width: 15,
            color: Colors.deepPurple,
          ),
          endChild: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to full-screen image when the card is tapped
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const FullScreenImage(
                //       imageUrl:
                //       'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAXzyemmMPxnh8d7KAoBectuQ5Mxn-UKaOTA&s',
                //     ),
                //   ),
                // );
              },
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(12), // More spacing inside the card
                  leading: Hero(
                    tag: 'imageHero', // Unique tag for hero animation
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0), // Rounded image corners
                      child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRAXzyemmMPxnh8d7KAoBectuQ5Mxn-UKaOTA&s',
                        width: 60, // Consistent image size
                        height: 60,
                        fit: BoxFit.cover, // Makes sure the image fills the area nicely
                      ),
                    ),
                  ),
                  title: const Text(
                    "Concert",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: const Text(
                    'Main Stage',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}