import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/user_interaction.dart';

class FeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box('user_behavior');
    final interactions = box.values.cast<UserInteraction>().toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: ListView.builder(
        itemCount: interactions.length,
        itemBuilder: (context, index) {
          final interaction = interactions[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(interaction.sender),
              subtitle: Text(interaction.message),
              trailing: Text(
                interaction.clicked ? 'Clicked' : 'Ignored',
                style: TextStyle(
                  color: interaction.clicked ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}