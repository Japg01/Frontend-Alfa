import 'package:alfa_soyzen/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:alfa_soyzen/presentation/homescreen.dart';

void main() => runApp(const MyApp());

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
        '/notification': (context) => const SplashScreen(),
      },
    );
  }
}
