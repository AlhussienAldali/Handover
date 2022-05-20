import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handover/core/notifications/notification_service.dart';
import 'core/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  NotificationService.init();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const App());
}
