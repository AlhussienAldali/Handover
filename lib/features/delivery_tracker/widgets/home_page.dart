import 'package:flutter/material.dart';
import 'package:handover/core/ui_and_statics/dimensions.dart';
import 'package:handover/features/delivery_tracker/provider/map_provider.dart';
import 'package:handover/features/delivery_tracker/widgets/delivery_info.dart';
import 'package:provider/provider.dart';
import 'delivery_map.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Dimensions.initiateValues(context);
    return Scaffold(
        body: ChangeNotifierProvider(
      create: (context) => MapProvider(),
      child: Consumer<MapProvider>(
        builder: (context, mapProvider, child) => Stack(
          children: const [DeliveryMap(), DeliveryInfo()],
        ),
      ),
    ));
  }
}
