import 'package:alfa_soyzen/presentation/Popular_Search.dart';
import 'package:alfa_soyzen/presentation/auth/location_screen.dart';
import 'package:alfa_soyzen/presentation/auth/verification_screen.dart';
import 'package:alfa_soyzen/presentation/homescreen.dart';
import 'package:alfa_soyzen/presentation/splashscreen/splash_screen.dart';
import 'package:alfa_soyzen/presentation/trainingscreen/trainingscreen.dart';
import 'package:alfa_soyzen/presentation/videos.dart';
import 'package:flutter/material.dart';
import 'package:alfa_soyzen/presentation/Course.dart';
import 'package:alfa_soyzen/presentation/Tips_topics.dart';
import 'presentation/notificationscreen/notificationscreen.dart';
import 'presentation/settingscreen/settingsscreen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gymnastic Center',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => HomeScreen(),
        '/notification': (context) => NotificationScreen(),
        '/settings': (context) => const SettingsPage(),
        '/verification': (context) => const VerificationScreen(),
        '/popularSearch': (context) => const PopularSearch(),
        '/trainingScreen': (context) => const TrainingScreen(),
        '/tipsTopics': (context) => const Tips_n_Topics_Screen(),
        '/videos': (context) => const Videos(),
        '/courses': (context) => const YogaHomePage(),
        '/location': (context) => const LocationScreen(),
      },
    );
  }
}
