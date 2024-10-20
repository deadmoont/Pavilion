import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:pavilion/Bottom%20Nav/bottom_nav.dart';
import 'package:pavilion/components/loading_view.dart';
import 'package:pavilion/firebase_options.dart';
import 'package:pavilion/screens/PhotoWallScreen.dart';
import 'package:pavilion/screens/event_details.dart';
import 'package:pavilion/screens/home_screen.dart';
import 'package:pavilion/screens/merchScreen.dart';
import 'package:pavilion/screens/reelsPage.dart';
import 'package:pavilion/screens/sponsors_page.dart';
import 'api/notif_api.dart';
import 'components/bottom_nav_bar.dart';
import 'screens/SplashScreen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Request notification permission and initialize notifications if granted
  bool permissionGranted = await requestNotificationPermission();

  if (permissionGranted) {
    // If permission granted, subscribe to topic and initialize notifications
    FirebaseMessaging.instance.subscribeToTopic('all').then((_) {
      print('Subscribed to "all" topic');
    }).catchError((error) {
      print('Failed to subscribe to topic: $error');
    });

    await FirebaseApi().initNotifications();
  } else {
    print('Notifications will not be initialized as permission is denied.');
  }

  runApp(const MyApp());
}

Future<bool> requestNotificationPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
    return true; // Permission granted
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
    return true; // Provisional permission granted, still allow notifications
  } else {
    print('User declined or has not accepted permission');
    return false; // Permission denied
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SplashScreen(),
    );
  }
}
