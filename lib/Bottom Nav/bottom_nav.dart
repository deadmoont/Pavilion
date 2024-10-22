import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_double_bullet/bottom_bar_double_bullet.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pavilion/screens/AllSocietyScreen.dart';
import 'package:pavilion/screens/loadingScreen.dart';
import 'package:pavilion/screens/timelineScreen.dart';

import '../screens/PhotoWallScreen.dart';
import '../screens/home_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex = 2;

  final List<Widget> _pages = [
    AllSocietyScreen(),
    Timeline(),
    const HomeScreen(),
    const PhotowallScreen(),
    Loadingscreen(),
  ];

  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomBarDoubleBullet(
        selectedIndex: _currentIndex,
        items: [
          BottomBarItem(
            iconBuilder: (color) => _buildSvgIcon("assets/svgIcons/events_unselect.svg", "assets/svgIcons/events_select.svg", 0, 34),
          ),
          BottomBarItem(
            iconBuilder: (color) => _buildSvgIcon("assets/svgIcons/timeline_select.svg", "assets/svgIcons/timeline_real_select.svg", 1, 30),
          ),
          BottomBarItem(
            iconBuilder: (color) => _buildIcon("assets/svgIcons/home_unselect.svg", "assets/images/effervescense_logo.png", 2, 37),
          ),
          BottomBarItem(
            iconBuilder: (color) => _buildSvgIcon("assets/svgIcons/reels_notselect.svg", "assets/svgIcons/reels_select.svg", 3, 25),
          ),
          BottomBarItem(
            iconBuilder: (color) => _buildSvgIcon("assets/svgIcons/about_unselect.svg", "assets/svgIcons/about_select.svg", 4, 34),
          ),
        ],
        circle1Color: Colors.blueAccent,
        backgroundColor: const Color.fromRGBO(39, 29, 29, 1),
        color: const Color.fromRGBO(238, 66, 116, 1),
        bubbleSize: 40,
        onSelect: _onItemSelected,
      ),
    );
  }

  // This helper method chooses between the selected and unselected SVG based on the index
  Widget _buildSvgIcon(String defaultSvg, String selectedSvg, int index, double size) {

    return SvgPicture.asset(
      _currentIndex == index ? selectedSvg : defaultSvg,
      color: _currentIndex == index ? const Color.fromRGBO(238, 66, 116, 1) : Colors.grey, // Optional: tint color based on selection
      width: size,
      height: size,
    );
  }
  Widget _buildIcon(String svgAsset, String pngAsset, int index, double size) {
    if (_currentIndex == index) {
      // Display PNG when selected
      return Image.asset(
        pngAsset,
        width: size,
        height: size,
      );
    } else {
      // Display SVG when unselected
      return SvgPicture.asset(
        svgAsset,
        width: size,
        height: size,
        color: Colors.grey, // Optional: Tint unselected SVG
      );
    }
  }
}

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:pavilion/screens/TeamsPage.dart';
// import 'package:pavilion/screens/home_screen.dart';
// import 'package:pavilion/screens/profileScreen.dart';
// import 'package:pavilion/screens/sponsors_page.dart';
// import 'package:pavilion/screens/timelineScreen.dart';
//
// import '../screens/PhotoWallScreen.dart';
//
// class BottomNav extends StatefulWidget {
//   const BottomNav({super.key});
//
//   @override
//   State<BottomNav> createState() => _BottomNavState();
// }
//
// class _BottomNavState extends State<BottomNav> {
//
//   late List<Widget> Pages;
//
//   late HomeScreen home;
//   late Timeline timeline;
//   late SponsorPage teamPage;
//   late ProfileScreen profile;
//   late PhotowallScreen photowall;
//   int currentTabIndex=0;
//
//   @override
//   void initState() {
//     timeline = Timeline();
//     home = HomeScreen();
//     photowall = PhotowallScreen();
//     teamPage = SponsorPage();
//     profile = ProfileScreen();
//     Pages = [home, timeline, teamPage, profile];
//     super.initState();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // Set the background color of the Scaffold to transparent
//       backgroundColor: Colors.transparent,
//
//       // Transparent CurvedNavigationBar
//       bottomNavigationBar: CurvedNavigationBar(
//         height: 70,
//         backgroundColor: Colors.transparent,  // Ensure the background of the bar is transparent
//         color:  Color.fromRGBO(39, 29, 29, 1),            // Make the navigation bar itself transparent
//         buttonBackgroundColor: Color.fromRGBO(238, 66, 116, 1), // Button background if needed
//         animationDuration: Duration(milliseconds: 500),
//         onTap: (int index) {
//           setState(() {
//             currentTabIndex = index;
//           });
//         },
//         items: const [
//           Icon(Icons.home_outlined, color: Colors.white),
//           Icon(Icons.timeline, color: Colors.white),
//           Icon(Icons.photo_library_rounded, color: Colors.white),
//           Icon(Icons.people_alt, color: Colors.white),
//           Icon(Icons.person_outlined, color: Colors.white),
//         ],
//       ),
//       body: Pages[currentTabIndex],
//     );
//   }
// }