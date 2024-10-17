import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pavilion/Bottom%20Nav/bottom_nav.dart';
import 'package:pavilion/firebase_options.dart';
import 'package:pavilion/screens/event_details.dart';
import 'package:pavilion/screens/home_screen.dart';
import 'package:pavilion/screens/reelsPage.dart';
import 'api/notif_api.dart';
import 'components/bottom_nav_bar.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: CustomNavBar(),
    );
  }
}
