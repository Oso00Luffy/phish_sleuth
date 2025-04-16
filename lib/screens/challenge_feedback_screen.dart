import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/weekly_challenge.dart';

class ChallengeFeedbackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final box = Hive.box<WeeklyChallenge>('weekly_challenges');
    final completedChallenges = box.values
        .cast<WeeklyChallenge>()
        .where((challenge) => challenge.userResponse != null)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Challenge Feedback'),
      ),
      body: completedChallenges.isEmpty
          ? Center(child: Text('No completed challenges yet.'))
          : ListView.builder(
        itemCount: completedChallenges.length,
        itemBuilder: (context, index) {
          final challenge = completedChallenges[index];

          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'From: ${challenge.sender}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(challenge.message),
                  Divider(),
                  Text(
                    'Your Response: ${challenge.userResponse == true ? 'Clicked' : 'Ignored'}',
                    style: TextStyle(
                      color: challenge.userResponse == true
                          ? Colors.red
                          : Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Explanation:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(challenge.explanation),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}