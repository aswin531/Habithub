import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class ReminderNotification {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

      static Future<void> initializeNotifications() async {
    var initializationSettingsAndroid = const AndroidInitializationSettings('app_icon');
    // var initializationSettingsIOS = IOSInitializationSettings(); // Use IOSInitializationSettings
    // ignore: unused_local_variable
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      // iOS: initializationSettingsIOS,
    );
  }
}