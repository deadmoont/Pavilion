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
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>SpecificEvent(image: event.image, title: event.name, des: event.description, venue: event.venue, form: event.form,)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                event.name, // Updated to use the event name dynamically
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
