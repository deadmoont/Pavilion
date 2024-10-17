// import 'package:flutter/material.dart';
// import '../models/event_model.dart';
//
//
// class EventScreen extends StatelessWidget {
//   final List<Event> events = [
//     Event(title: 'GRAFFITI'),
//     Event(title: 'FACE PAINTING'),
//     Event(title: 'SCHIZZ'),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           'Nirmiti',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemCount: events.length,
//         itemBuilder: (context, index) {
//           return EventCard(event: events[index]);
//         },
//       ),
//
//     );
//   }
// }
