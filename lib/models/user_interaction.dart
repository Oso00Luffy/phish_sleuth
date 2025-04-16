import 'package:hive/hive.dart';

part 'user_interaction.g.dart';

@HiveType(typeId: 0)
class UserInteraction {
  @HiveField(0)
  final String sender;

  @HiveField(1)
  final String message;

  @HiveField(2)
  final bool clicked;

  @HiveField(3)
  final DateTime timestamp;

  UserInteraction({
    required this.sender,
    required this.message,
    required this.clicked,
    required this.timestamp,
  });
}