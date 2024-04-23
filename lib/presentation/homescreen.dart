import 'package:flutter/material.dart';
import 'package:alfa_soyzen/widgets/navegation.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
        backgroundColor: Colors.purple,
      ),
      body: FractionallySizedBox(
        alignment: Alignment.topCenter,
        heightFactor: 0.3,
        child: Container(
          color: Colors.purple,
        ),
      ),
      bottomNavigationBar: const BarraNavegacion(),
    );
  }
}
