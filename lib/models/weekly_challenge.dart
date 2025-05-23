import 'package:hive/hive.dart';

part 'weekly_challenge.g.dart';

@HiveType(typeId: 1)
class WeeklyChallenge {
  @HiveField(0)
  final String sender;

  @HiveField(1)
  final String message;

  @HiveField(2)
  final bool? userResponse;

  @HiveField(3)
  final int points;

  @HiveField(4)
  final String explanation; // Add explanation field

  WeeklyChallenge({
    required this.sender,
    required this.message,
    this.userResponse,
    required this.points,
    required this.explanation,
  });

  WeeklyChallenge copyWith({bool? userResponse}) {
    return WeeklyChallenge(
      sender: sender,
      message: message,
      userResponse: userResponse,
      points: points,
      explanation: explanation,
    );
  }
}