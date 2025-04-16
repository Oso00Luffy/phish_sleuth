import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> scheduleWeeklyNotification(
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
  const AndroidNotificationDetails androidPlatformChannelSpecifics =
  AndroidNotificationDetails(
    'weekly_challenges_channel',
    'Weekly Challenges',
    channelDescription: 'Notifications for new weekly challenges',
    importance: Importance.max,
    priority: Priority.high,
  );

  const NotificationDetails platformChannelSpecifics =
  NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.periodicallyShow(
    0,
    'New Weekly Challenges Available!',
    'Check out the latest phishing challenges and test your skills!',
    RepeatInterval.weekly,
    platformChannelSpecifics,
  );
}