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
      title: 'Mi Aplicación',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        '/notification': (context) => const NotificationScreen(),
      },
    );
  }
}
