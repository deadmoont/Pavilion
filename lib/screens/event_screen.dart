import 'package:flutter/material.dart';
import 'package:pavilion/database/Apis.dart';
import 'package:pavilion/models/SocietyEvents.dart';
import '../components/event_card.dart';
import '../models/event_model.dart';

class EventScreen extends StatefulWidget {
  final String item;
  final List<SocietyEve> list;

  const EventScreen({super.key, required this.list, required this.item});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      appBar: AppBar(
        backgroundColor: const Color(0xFF121212),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.item,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            APIs.fetchSocietyDataFirebase();
          });
        },
        child: ListView.builder(
          padding: const EdgeInsets.all(16.0),
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return EventCard(event: widget.list[index]);
          },
        ),
      ),
    );
  }
}
