import 'package:handover/core/notifications/notification_service.dart';
import 'package:handover/core/ui_and_statics/app_strings.dart';

Future<void> simulateNotifications() async {
  NotificationService.initTimeZones();

  await NotificationService.showNotification(0, AppStrings.notificationsTitle,
      AppStrings.onTheWayBody, nearPickUpNotificationTime);
  await NotificationService.showNotification(1, AppStrings.notificationsTitle,
      AppStrings.pickedUpDeliveryBody, arrivedToPickUpNotificationTime);
  await NotificationService.showNotification(
      2,
      AppStrings.notificationsTitle,
      AppStrings.nearDeliveryDestinationBody,
      nearDeliveryDestinationNotificationTime);
  await NotificationService.showNotification(
      3,
      AppStrings.notificationsTitle,
      AppStrings.deliveredPackageBody,
      arrivedToDeliveryDestinationNotificationTime);
}

const int nearPickUpNotificationTime = 27;
const int arrivedToPickUpNotificationTime = 34;
const int nearDeliveryDestinationNotificationTime = 65;
const int arrivedToDeliveryDestinationNotificationTime = 70;
