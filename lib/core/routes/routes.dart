import 'package:flutter/material.dart';
import 'package:handover/features/delivery_tracker/widgets/end_page.dart';
import 'package:handover/features/delivery_tracker/widgets/home_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const HomePage(),
  '/result': (context) => const EndPage()
};
