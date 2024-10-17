import 'package:another_stepper/dto/stepper_data.dart';
import 'package:another_stepper/widgets/another_stepper.dart';
import 'package:flutter/material.dart';

import '../components/MyListTile.dart';

class Timeline extends StatelessWidget {
  const Timeline({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Time Line", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: ListView(
          children: const [
            SizedBox(height: 30,),
            Center(
              child: Text("Day 1", style: TextStyle(fontSize: 24 , color: Colors.white),),
            ),
            MyListTile(isFirst: true, isLast: false),
            MyListTile(isFirst: false, isLast: false),
            MyListTile(isFirst: false, isLast: false),
            MyListTile(isFirst: false, isLast: false),
            SizedBox(height: 30,),
            Center(
              child: Text("Day 2", style: TextStyle(fontSize: 24 , color: Colors.white),),
            ),
            MyListTile(isFirst: false, isLast: false),
            MyListTile(isFirst: false, isLast: false),
            MyListTile(isFirst: false, isLast: false),
            MyListTile(isFirst: false, isLast: false),
            SizedBox(height: 30,),
            Center(
              child: Text("Day 3", style: TextStyle(fontSize: 24 , color: Colors.white),),
            ),
            MyListTile(isFirst: false, isLast: false),
            MyListTile(isFirst: false, isLast: false),
            MyListTile(isFirst: false, isLast: false),
            MyListTile(isFirst: false, isLast: true),
          ],
        ),
      ),
    );
  }
}