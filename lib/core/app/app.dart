import 'package:flutter/material.dart';

import '../routes/routes.dart';
import '../ui_constrains/themes/app_theme.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of  application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightTheme(),
      darkTheme: darkTheme(),
      routes: appRoutes,
    );
  }
}
