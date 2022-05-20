import 'package:flutter/material.dart';
import 'package:handover/features/delivery_tracker/widgets/delivery_time_line.dart';

class MapProvider extends ChangeNotifier {
  DeliveryStage deliveryStage = DeliveryStage.onTheWay;
  DateTime? pickUpTime;
  DateTime? deliveredTime;

  void updateStage(DeliveryStage newValue) {
    deliveryStage = newValue;
    notifyListeners();
  }
}
