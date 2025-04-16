import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/user_score.dart';

class LeaderboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final scoresBox = Hive.box<UserScore>('user_scores');
    final scores = scoresBox.values.toList()
      ..sort((a, b) => b.score.compareTo(a.score)); // Sort by score descending

    return Scaffold(
      appBar: AppBar(
        title: Text('Leaderboard'),
      ),
      body: ListView.builder(
        itemCount: scores.length,
        itemBuilder: (context, index) {
          final userScore = scores[index];

          return ListTile(
            title: Text(userScore.username),
            trailing: Text('${userScore.score} points'),
          );
        },
      ),
    );
  }
}