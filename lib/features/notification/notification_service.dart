import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _notificationsPlugin.initialize(initializationSettings);
    tz.initializeTimeZones(); // Initialize time zones for scheduling
  }

  // Show immediate notification (for testing)
  static Future<void> showNotification(
      {required int id, required String title, required String body}) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails('main_channel', 'Main Channel',
            importance: Importance.max, priority: Priority.high);

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
    );
  }

  // Schedule a notification for a specific time
  static Future<void> scheduleNotification(
      {required int id,
      required String title,
      required String body,
      required DateTime scheduledTime}) async {
    await _notificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledTime, tz.local),
      const NotificationDetails(
        android: AndroidNotificationDetails('main_channel', 'Main Channel',
            importance: Importance.max, priority: Priority.high),
      ),

      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents:
          DateTimeComponents.time, // Only schedule once at the exact time
    );
  }

  // Cancel a notification
  static Future<void> cancelNotification(int id) async {
    await _notificationsPlugin.cancel(id);
  }
}
