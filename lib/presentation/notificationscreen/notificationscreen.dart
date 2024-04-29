import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.notifications_none,
              size: 100.0,
              color: Colors.grey, // Use the primary color of your app
            ),
            const Text(
              "Can't find notifications",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.grey, // Use the text color of your app
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 16.0),
              child: Text(
                "Let's explore more content around you.",
                style: TextStyle(
                  color: Colors.grey, // Again, use the text color of your app
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // Add your onPressed code here!
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.purple, // Use the accent color of your app
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                child: const Text('Back to Feed'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
