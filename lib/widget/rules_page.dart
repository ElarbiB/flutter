import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class RulesPage extends StatefulWidget {
  @override
  State<RulesPage> createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Rules'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Rules of the Quiz Game:',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              '1. You will get multiple-choice questions.\n'
              '2. Select the correct answer to score points.\n'
              '3. Each correct answer gives you +10 points.\n'
              '4. There is no time limit for the questions.\n'
              '5. Try to get the highest score possible!',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}