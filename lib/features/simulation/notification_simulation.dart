import 'package:handover/core/notifications/notifications.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    if (inputData!["notificationNumber"] == 0) {
      Notifications.showNearPickUpNotification();
    }
    if (inputData["notificationNumber"] == 1) {
      Notifications.showArrivedToPickUpNotification();
    }
    if (inputData["notificationNumber"] == 2) {
      Notifications.showNearDeliveryDestinationNotification();
    }
    if (inputData["notificationNumber"] == 3) {
      Notifications.showArrivedToDeliveryDestinationNotification();
    }
    return Future.value(true);
  });
}

const int nearPickUpNotificationTime = 27;
const int arrivedToPickUpNotificationTime = 34;
const int nearDeliveryDestinationNotificationTime = 65;
const int arrivedToDeliveryDestinationNotificationTime = 68;
