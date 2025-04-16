import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../models/weekly_challenge.dart';
import '../models/user_score.dart';

class WeeklyChallengesScreen extends StatelessWidget {
  final String username = 'User1'; // Replace with actual user login

  @override
  Widget build(BuildContext context) {
    final challengesBox = Hive.box<WeeklyChallenge>('weekly_challenges');
    final scoresBox = Hive.box<UserScore>('user_scores');

    // Ensure the user has a score entry
    if (!scoresBox.containsKey(username)) {
      scoresBox.put(username, UserScore(username: username, score: 0));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Weekly Challenges'),
      ),
      body: ValueListenableBuilder(
        valueListenable: challengesBox.listenable(),
        builder: (context, Box<WeeklyChallenge> challenges, _) {
          if (challenges.isEmpty) {
            return Center(child: Text('No challenges available.'));
          }

          return ListView.builder(
            itemCount: challenges.length,
            itemBuilder: (context, index) {
              final challenge = challenges.getAt(index)!;

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
                      SizedBox(height: 10),
                      if (challenge.userResponse == null)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                // Update challenge and add points
                                challengesBox.putAt(
                                  index,
                                  challenge.copyWith(userResponse: true),
                                );

                                final userScore = scoresBox.get(username)!;
                                userScore.addPoints(challenge.points);
                                scoresBox.put(username, userScore);

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                        'You clicked the link! +${challenge.points} points'),
                                  ),
                                );
                              },
                              child: Text('Click'),
                            ),
                            TextButton(
                              onPressed: () {
                                challengesBox.putAt(
                                  index,
                                  challenge.copyWith(userResponse: false),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text('You ignored the message!')),
                                );
                              },
                              child: Text('Ignore'),
                            ),
                          ],
                        )
                      else
                        Text(
                          challenge.userResponse == true
                              ? 'You clicked the link!'
                              : 'You ignored the message!',
                          style: TextStyle(
                            color: challenge.userResponse == true
                                ? Colors.red
                                : Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}