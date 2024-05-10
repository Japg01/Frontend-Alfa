import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        title: const Text('We are happy to help'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Frequently Asked Questions:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          const FAQQuestion(title: "What does Yaga mean slang?"),
          const FAQQuestion(title: "What does Namaste mean?"),
          const FAQQuestion(
              title: "Can I do yoga if I'm not flexible?",
              expanded: true,
              answer:
                  "Complete Beginners should start here. This bundle will teach basic yoga poses to fill with energy and joy. Hope on your mat and start to build...."),
          const FAQQuestion(title: "What are the benefits of yoga?"),
          const FAQQuestion(title: "What are the disadvantages of yoga?"),
          const FAQQuestion(title: "What is the best time to do yoga?"),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              // Implement your action
            },
            child: const Text('See all',
                style: TextStyle(color: Colors.deepPurple)),
          ),
        ],
      ),
    );
  }
}

class FAQQuestion extends StatelessWidget {
  final String title;
  final String answer;
  final bool expanded;

  const FAQQuestion(
      {super.key,
      required this.title,
      this.answer = "",
      this.expanded = false});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(title),
      initiallyExpanded: expanded,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(answer, style: TextStyle(color: Colors.grey[700])),
        ),
      ],
    );
  }
}
