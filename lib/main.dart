import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/app/app.dart';
import 'core/dependency_injection/di.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureInjection();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const App());
}
