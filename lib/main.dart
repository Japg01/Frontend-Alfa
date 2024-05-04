import 'package:flutter/material.dart';
import 'package:alfa_soyzen/presentation/homescreen.dart';

import 'presentation/notificationscreen/notificationscreen.dart';

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
      home: HomeScreen(),
      routes: {
        '/notification': (context) => NotificationScreen(),
      },
    );
  }
}
