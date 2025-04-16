import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'models/user_interaction.dart';
import 'models/weekly_challenge.dart';
import 'utils/challenge_generator.dart';
import 'screens/home_screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Register adapters
  Hive.registerAdapter(UserInteractionAdapter());
  Hive.registerAdapter(WeeklyChallengeAdapter());

  // Open boxes
  await Hive.openBox('user_behavior');
  await Hive.openBox<WeeklyChallenge>('weekly_challenges');

  // Populate challenges
  await populateWeeklyChallenges();

  // Initialize notifications
  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  const InitializationSettings initializationSettings =
  InitializationSettings(android: initializationSettingsAndroid);

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

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