import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationDataSource {
  NotificationDataSource._();

  static final _notification = FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    await _notification.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('ic_launcher'),
      ),
    );
  }

  static Future<void> showNotification() async {
    _notification.show(
      0,
      'Hey',
      'You liked this post.',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'Channel ID',
          'Channel title',
          priority: Priority.high,
          importance: Importance.max,
        ),
      ),
    );
  }
}
