import 'package:hive/hive.dart';

part 'user_score.g.dart';

@HiveType(typeId: 2)
class UserScore {
  @HiveField(0)
  final String username;

  @HiveField(1)
  int score;

  UserScore({required this.username, required this.score});

  void addPoints(int points) {
    score += points;
  }
}