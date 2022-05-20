import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:handover/core/notifications/notification_service.dart';
import 'package:handover/core/ui_and_statics/app_strings.dart';

class Notifications {
  //we have four types of notifications
  static void showNearPickUpNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '0',
      'showOnMyWayNotification',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await NotificationService.flutterLocalNotificationsPlugin.show(
      0,
      AppStrings.notificationsTitle,
      'The driver is near pick up point',
      platformChannelSpecifics,
    );
  }

  static void showArrivedToPickUpNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '1',
      'showArrivedToPickUpNotification',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await NotificationService.flutterLocalNotificationsPlugin.show(
      1,
      AppStrings.notificationsTitle,
      'The driver has arrived to pick up point',
      platformChannelSpecifics,
    );
  }

  static void showNearDeliveryDestinationNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '2',
      'showNearDeliveryDestinationNotification',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await NotificationService.flutterLocalNotificationsPlugin.show(
      2,
      AppStrings.notificationsTitle,
      'The driver is near Delivery point, get ready please',
      platformChannelSpecifics,
    );
  }

  static void showArrivedToDeliveryDestinationNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      '3',
      'showArrivedToDeliveryDestinationNotification',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await NotificationService.flutterLocalNotificationsPlugin.show(
      3,
      AppStrings.notificationsTitle,
      'The driver has arrived to delivery point',
      platformChannelSpecifics,
    );
  }
}
