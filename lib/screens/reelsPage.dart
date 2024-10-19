// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import '../components/Detailcard.dart';
// import '../utils/constants.dart';
//
// class ReelsPage extends StatefulWidget {
//   const ReelsPage({super.key});
//
//   @override
//   State<ReelsPage> createState() => _ReelsPageState();
// }
//
// class _ReelsPageState extends State<ReelsPage> {
//   // List of video URLs
//   final List<String> videoUrls = [
//     "https://firebasestorage.googleapis.com/v0/b/pavilion-b793c.appspot.com/o/WhatsApp%20Video%202024-10-05%20at%201.00.39%20PM.mp4?alt=media&token=2b0ed762-cbba-46b6-a678-0e70adb7533e",
//     "https://firebasestorage.googleapis.com/v0/b/pavilion-b793c.appspot.com/o/WhatsApp%20Video%202024-10-05%20at%201.00.39%20PM.mp4?alt=media&token=2b0ed762-cbba-46b6-a678-0e70adb7533e",
//     "https://firebasestorage.googleapis.com/v0/b/pavilion-b793c.appspot.com/o/WhatsApp%20Video%202024-10-05%20at%201.00.39%20PM.mp4?alt=media&token=2b0ed762-cbba-46b6-a678-0e70adb7533e",
//   ];
//
//   late PageController _pageController;
//
//   @override
//   void initState() {
//     super.initState();
//     _pageController = PageController();
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         title: Text(
//           'ReelsPage',
//           style: GoogleFonts.epilogue(
//             textStyle: TextStyle(
//               color: Constants.BLACK,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications_active),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: PageView.builder(
//         controller: _pageController,
//         scrollDirection: Axis.vertical, // Vertical scrolling
//         itemCount: videoUrls.length,
//         itemBuilder: (context, index) {
//           return Detailcard(
//             videoUrl: videoUrls[index],
//             onVideoEnd: () {
//               // Automatically play the next video when the current one ends
//               if (index < videoUrls.length - 1) {
//                 _pageController.nextPage(
//                   duration: Duration(milliseconds: 300),
//                   curve: Curves.easeIn,
//                 );
//               }
//             },
//           );
//         },
//       ),
//     );
//   }
// }