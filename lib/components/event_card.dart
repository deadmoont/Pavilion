import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:pavilion/components/loading_view.dart';
import 'package:pavilion/models/SocietyEvents.dart';
import 'package:pavilion/screens/SpecificEvents.dart';

class EventCard extends StatelessWidget {
  final SocietyEve event;

  EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to the specific event screen, passing event data
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SpecificEvent(
              image: event.image,
              title: event.name, // Use the event name dynamically for the title
              des: event.description,
              venue: event.venue,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            // Event Image
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              child: CachedNetworkImage(
                imageUrl: event.image,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  height: 100,
                  color: Colors.grey[200],
                  child: Center(
                    child: LoadingView(height: 50, width: 50),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  height: 100,
                  color: Colors.grey[200],
                  child: Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            // Event Name
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                event.name, // Display the event name dynamically
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
