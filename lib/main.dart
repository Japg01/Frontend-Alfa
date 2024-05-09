import 'package:alfa_soyzen/presentation/Course.dart';
import 'package:alfa_soyzen/presentation/Tips_topics.dart';
import 'package:flutter/material.dart';
import 'package:alfa_soyzen/presentation/homescreen.dart';
import 'presentation/notificationscreen/notificationscreen.dart';
import 'presentation/settingscreen/settingsscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gymnastic Center',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: (const Yoga_basics()),
      routes: {
        '/home': (context) => HomeScreen(),
        '/notification': (context) => NotificationScreen(),
        '/settings': (context) => const SettingsPage(),
      },
    );
  }
}
