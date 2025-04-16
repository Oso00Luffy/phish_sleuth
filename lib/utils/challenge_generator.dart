import 'package:hive/hive.dart';
import '../models/weekly_challenge.dart';

Future<void> populateWeeklyChallenges() async {
  final box = Hive.box<WeeklyChallenge>('weekly_challenges');

  if (box.isEmpty) {
    final challenges = [
      WeeklyChallenge(
        sender: 'Netflix',
        message: 'Your subscription will expire soon. Click here to renew now.',
        points: 10,
      ),
      WeeklyChallenge(
        sender: 'Apple Support',
        message: 'Your Apple ID has been locked. Click here to unlock it.',
        points: 15,
      ),
      WeeklyChallenge(
        sender: 'LinkedIn',
        message: 'You have a new connection request. View it now.',
        points: 20,
      ),
    ];

    for (var challenge in challenges) {
      await box.add(challenge);
    }
  }
}