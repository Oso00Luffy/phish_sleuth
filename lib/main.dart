import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'models/user_interaction.dart';
import 'models/weekly_challenge.dart';
import 'screens/home_screen.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Register adapters
  Hive.registerAdapter(UserInteractionAdapter());
  Hive.registerAdapter(WeeklyChallengeAdapter());

  // Open boxes
  await Hive.openBox('user_behavior');
  await Hive.openBox<WeeklyChallenge>('weekly_challenges');

  runApp(PhishSleuthApp());
}

class PhishSleuthApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhishSleuth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
