import 'package:flutter/material.dart';
import 'package:pavilion/screens/PhotoWallScreen.dart';
import 'package:pavilion/screens/SignUpScreen.dart';
import 'package:pavilion/screens/SpecificEvents.dart';
import 'package:pavilion/screens/TeamsPage.dart';
import 'package:pavilion/screens/home_screen.dart';
import 'package:pavilion/screens/merchScreen.dart';
import 'package:pavilion/screens/profileScreen.dart';
import 'package:pavilion/screens/test.dart';
import 'package:pavilion/screens/timelineScreen.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          height: 70,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Home",
              ),
              Tab(
                icon: Icon(Icons.search),
                text: "Search",
              ),
              Tab(
                icon: Icon(Icons.photo_library_outlined),
                text: "New & Hot",
              ),
              Tab(
                icon: Icon(Icons.photo_library_outlined),
                text: "TimeLine",
              )
            ],
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: Color(0xff999999),
          ),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            SpecificEvent(),
            TeamPage(),
            Timeline()
          ],
        ),
      ),
    );
  }
}
