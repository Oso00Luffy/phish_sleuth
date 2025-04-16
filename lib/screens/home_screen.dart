import 'package:flutter/material.dart';
import 'simulation_screen.dart';
import 'feedback_screen.dart';
import 'weekly_challenges_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhishSleuth'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SimulationScreen()),
                );
              },
              child: Text('Start Simulation'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FeedbackScreen()),
                );
              },
              child: Text('View Feedback'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WeeklyChallengesScreen()),
                );
              },
              child: Text('Weekly Challenges'),
            ),
          ],
        ),
      ),
    );
  }
}