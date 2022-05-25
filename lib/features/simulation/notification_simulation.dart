import 'package:handover/core/notifications/notification_service.dart';
import 'package:handover/core/ui_and_statics/app_strings.dart';

Future<void> simulateNotifications() async {
  NotificationService.initTimeZones();

  await NotificationService.showNotification(0, AppStrings.notificationsTitle,
      'The driver is near pick up point', nearPickUpNotificationTime);
  await NotificationService.showNotification(
      1,
      AppStrings.notificationsTitle,
      'The driver is near Delivery point, get ready please',
      arrivedToPickUpNotificationTime);
  await NotificationService.showNotification(
      2,
      AppStrings.notificationsTitle,
      'The driver is near Delivery point, get ready please',
      nearDeliveryDestinationNotificationTime);
  await NotificationService.showNotification(
      3,
      AppStrings.notificationsTitle,
      'The driver has arrived to delivery point',
      arrivedToDeliveryDestinationNotificationTime);
}

const int nearPickUpNotificationTime = 27;
const int arrivedToPickUpNotificationTime = 34;
const int nearDeliveryDestinationNotificationTime = 65;
const int arrivedToDeliveryDestinationNotificationTime = 68;
