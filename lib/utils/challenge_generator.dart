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
        explanation: 'This email creates a sense of urgency to trick you into clicking on a fake link. Always verify sender addresses.',
      ),
      WeeklyChallenge(
        sender: 'Apple Support',
        message: 'Your Apple ID has been locked. Click here to unlock it.',
        points: 15,
        explanation: 'Apple will never ask you to click a link to unlock your account. Always verify with official support.',
      ),
      WeeklyChallenge(
        sender: 'LinkedIn',
        message: 'You have a new connection request. View it now.',
        points: 20,
        explanation: 'Check the sender’s email address. LinkedIn requests always come from a LinkedIn domain.',
      ),
    ];

    for (var challenge in challenges) {
      await box.add(challenge);
    }
  }
}