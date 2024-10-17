import 'package:bottom_bar_matu/bottom_bar/bottom_bar_bubble.dart';
import 'package:bottom_bar_matu/bottom_bar_double_bullet/bottom_bar_double_bullet.dart';
import 'package:bottom_bar_matu/bottom_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:pavilion/screens/merchScreen.dart';
import 'package:pavilion/screens/profileScreen.dart';
import 'package:pavilion/screens/timelineScreen.dart';

import '../screens/home_screen.dart';

class CustomNavBar extends StatefulWidget {
  @override
  _CustomNavBarState createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  int _currentIndex = 0;

  // List of pages to switch between
  final List<Widget> _pages = [
    HomeScreen(),
    Timeline(),
    MerchScreen(),
    ProfileScreen(),
  ];

  // Method to change the selected page
  void _onItemSelected(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: BottomBarDoubleBullet(
        selectedIndex: _currentIndex,
        items: [
          BottomBarItem(
            iconBuilder: (color) => Icon(Icons.home, color: color, size: 30),
          ),
          BottomBarItem(
            iconBuilder: (color) => Icon(Icons.alarm, color: color, size: 30),
          ),
          BottomBarItem(
            iconBuilder: (color) => Icon(Icons.receipt, color: color, size: 30),
          ),
          BottomBarItem(
            iconBuilder: (color) => Icon(Icons.inbox, color: color, size: 30),
          ),
        ],
        // Animation and style settings
        circle1Color: Colors.blueAccent,
        backgroundColor: Colors.black,
        color: Colors.grey,
        bubbleSize: 40,
        //selectedIconColor: Colors.purple, // Selected icon color
        onSelect: _onItemSelected, // On tab select function
      ),
    );
  }
}


//
//   String page = 'Grey';
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       bottomNavigationBar: PandaBar(
//         buttonData: [
//           PandaBarButtonData(
//               id: 'Grey',
//               icon: Icons.dashboard,
//               title: 'Grey'
//           ),
//           PandaBarButtonData(
//               id: 'Blue',
//               icon: Icons.book,
//               title: 'Blue'
//           ),
//           PandaBarButtonData(
//               id: 'Red',
//               icon: Icons.account_balance_wallet,
//               title: 'Red'
//           ),
//           PandaBarButtonData(
//               id: 'Yellow',
//               icon: Icons.notifications,
//               title: 'Yellow'
//           ),
//         ],
//         onChange: (id) {
//           setState(() {
//             page = id;
//           });
//         },
//         onFabButtonPressed: () {
//
//         },
//       ),
//       body: Builder(
//         builder: (context) {
//
//           switch (page) {
//             case 'Grey':
//               return HomeScreen();
//             case 'Blue':
//               return Timeline();
//             case 'Red':
//               return SpecificEvent();
//             case 'Yellow':
//               return ProfileScreen();
//             default:
//               return HomeScreen();
//
//           }
//
//         },
//       ),
//     );
//   }
// }

// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:perfect/Pages/home.dart';
// import 'package:perfect/Pages/order.dart';
// import 'package:perfect/Pages/profile.dart';
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
//   late Home home;
//   late Order order;
//   late Profile profile;
//   int currentTabIndex=0;
//
//   @override
//   void initState() {
//     order = Order();
//     home = Home();
//     profile = Profile();
//     Pages = [home, order,  profile];
//     super.initState();
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         height: 70,
//         backgroundColor: Color(0xfff2f2f2),
//         color: Colors.black,
//         animationDuration: Duration(milliseconds: 500),
//         onTap: (int index){
//           setState(() {
//             currentTabIndex = index;
//           });
//         },
//         items: [
//           Icon(Icons.home_outlined, color: Colors.white,),
//           Icon(Icons.shopping_cart_outlined, color: Colors.white,),
//           Icon(Icons.person_outlined, color: Colors.white,)
//         ],),
//       body: Pages[currentTabIndex],
//     );
//   }
// }