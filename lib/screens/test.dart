// import 'package:flutter/material.dart';
// import 'package:timeline_tile_nic/timeline_tile.dart';
//
// class TimelinePage extends StatelessWidget {
//   const TimelinePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Timeline',
//           style: TextStyle(color: Colors.white),
//         ),
//         backgroundColor: Colors.black,
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             // First Timeline Tile (Image, Title, Subtitle)
//             TimelineTile(
//               alignment: TimelineAlign.manual,
//               lineXY: 0.1,
//               isFirst: true,
//               beforeLineStyle: const LineStyle(
//                 color: Colors.purple,
//                 thickness: 6,
//               ),
//               indicatorStyle: IndicatorStyle(
//                 width: 60,
//                 height: 60,
//                 indicator: ClipRRect(
//                   borderRadius: BorderRadius.circular(30),
//                   child: Image.network(
//                     'https://via.placeholder.com/60', // Replace with your image URL
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               endChild: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       'Concert',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 6),
//                     Text(
//                       'Main Stage Event',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Divider Between First and Second Timeline Tile
//             const TimelineDivider(
//               begin: 0.1,
//               end: 0.9,
//               thickness: 6,
//               color: Colors.purple,
//             ),
//             // Second Timeline Tile (Image, Title, Subtitle)
//             TimelineTile(
//               alignment: TimelineAlign.manual,
//               lineXY: 0.9,
//               beforeLineStyle: const LineStyle(
//                 color: Colors.purple,
//                 thickness: 6,
//               ),
//               afterLineStyle: const LineStyle(
//                 color: Colors.deepOrange,
//                 thickness: 6,
//               ),
//               indicatorStyle: IndicatorStyle(
//                 width: 60,
//                 height: 60,
//                 indicator: ClipRRect(
//                   borderRadius: BorderRadius.circular(30),
//                   child: Image.network(
//                     'https://via.placeholder.com/60', // Replace with your image URL
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               endChild: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       'Art Exhibition',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 6),
//                     Text(
//                       'Gallery 1',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             // Divider Between Second and Third Timeline Tile
//             const TimelineDivider(
//               begin: 0.1,
//               end: 0.9,
//               thickness: 6,
//               color: Colors.deepOrange,
//             ),
//             // Third Timeline Tile (Image, Title, Subtitle)
//             TimelineTile(
//               alignment: TimelineAlign.manual,
//               lineXY: 0.1,
//               isLast: true,
//               beforeLineStyle: const LineStyle(
//                 color: Colors.deepOrange,
//                 thickness: 6,
//               ),
//               indicatorStyle: IndicatorStyle(
//                 width: 60,
//                 height: 60,
//                 indicator: ClipRRect(
//                   borderRadius: BorderRadius.circular(30),
//                   child: Image.network(
//                     'https://via.placeholder.com/60', // Replace with your image URL
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               endChild: Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: const [
//                     Text(
//                       'Closing Ceremony',
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     SizedBox(height: 6),
//                     Text(
//                       'Main Stage',
//                       style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }