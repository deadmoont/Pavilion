// import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
// import 'package:bottom_bar_matu/bottom_bar_double_bullet/bottom_bar_double_bullet.dart';
// import 'package:bottom_bar_matu/bottom_bar_item.dart';
// import 'package:flutter/material.dart';
// import 'package:pavilion/screens/TeamsPage.dart';
// import 'package:pavilion/screens/merchScreen.dart';
// import 'package:pavilion/screens/profileScreen.dart';
// import 'package:pavilion/screens/timelineScreen.dart';
//
// import '../screens/home_screen.dart';
//
// class CustomNavBar extends StatefulWidget {
//   @override
//   _CustomNavBarState createState() => _CustomNavBarState();
// }
//
// class _CustomNavBarState extends State<CustomNavBar> {
//   int _currentIndex = 0;
//
//
//   final List<Widget> _pages = [
//     HomeScreen(),
//     Timeline(),
//     TeamPage(),
//     ProfileScreen(),
//   ];
//
//
//   void _onItemSelected(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _pages[_currentIndex],
//       bottomNavigationBar: BottomBarDoubleBullet(
//         selectedIndex: _currentIndex,
//         items: [
//           BottomBarItem(
//             iconBuilder: (color) => Icon(Icons.home, color: color, size: 30),
//           ),
//           BottomBarItem(
//             iconBuilder: (color) => Icon(Icons.alarm, color: color, size: 30),
//           ),
//           BottomBarItem(
//             iconBuilder: (color) => Icon(Icons.receipt, color: color, size: 30),
//           ),
//           BottomBarItem(
//             iconBuilder: (color) => Icon(Icons.inbox, color: color, size: 30),
//           ),
//         ],
//         // Animation and style settings
//         circle1Color: Colors.blueAccent,
//         backgroundColor: Colors.black,
//         color: Colors.grey,
//         bubbleSize: 40,
//         //selectedIconColor: Colors.purple, // Selected icon color
//         onSelect: _onItemSelected, // On tab select function
//       ),
//     );
//   }
// }

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:pavilion/screens/TeamsPage.dart';
import 'package:pavilion/screens/home_screen.dart';
import 'package:pavilion/screens/profileScreen.dart';
import 'package:pavilion/screens/sponsors_page.dart';
import 'package:pavilion/screens/timelineScreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {

  late List<Widget> Pages;

  late HomeScreen home;
  late Timeline timeline;
  late SponsorPage teamPage;
  late ProfileScreen profile;
  int currentTabIndex=0;

  @override
  void initState() {
    timeline = Timeline();
    home = HomeScreen();
    teamPage = SponsorPage();
    profile = ProfileScreen();
    Pages = [home, timeline, teamPage, profile];
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        backgroundColor: Colors.black,
        color: Colors.blue,
        animationDuration: Duration(milliseconds: 500),
        onTap: (int index){
          setState(() {
            currentTabIndex = index;
          });
        },
        items: const [
          Icon(Icons.home_outlined, color: Colors.white,),
          Icon(Icons.timeline, color: Colors.white,),
          Icon(Icons.people_alt, color: Colors.white,),
          Icon(Icons.person_outlined, color: Colors.white,)
        ],),
      body: Pages[currentTabIndex],
    );
  }
}