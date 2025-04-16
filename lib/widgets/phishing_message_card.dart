import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/user_interaction.dart';

class PhishingMessageCard extends StatelessWidget {
  final String sender;
  final String message;

  PhishingMessageCard({required this.sender, required this.message});

  void _saveInteraction(bool clicked) async {
    final box = Hive.box('user_behavior');
    final interaction = UserInteraction(
      sender: sender,
      message: message,
      clicked: clicked,
      timestamp: DateTime.now(),
    );
    await box.add(interaction);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'From: $sender',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 5),
            Text(message),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    _saveInteraction(true);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('You clicked the link!'),
                    ));
                  },
                  child: Text('Click'),
                ),
                TextButton(
                  onPressed: () {
                    _saveInteraction(false);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('You ignored the message!'),
                    ));
                  },
                  child: Text('Ignore'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}