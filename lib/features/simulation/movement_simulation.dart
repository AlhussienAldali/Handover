import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handover/core/utils/utils.dart';
import 'package:handover/features/delivery_tracker/provider/map_provider.dart';
import 'package:handover/features/delivery_tracker/widgets/delivery_time_line.dart';
import 'package:provider/provider.dart';

simulateMarkerMovement(
  context,
  _markers,
  controller,
  double fromLat, //Starting latitude
  double fromLong, //Starting longitude
  double toLat, //Ending latitude
  double toLong, //Ending longitude
  StreamSink<List<Marker>> mapMarkerSink,
) async {
  double i = 0;
  Timer.periodic(const Duration(seconds: 3), (t) async {
    i += 0.1;
    if (i > 1.0) {
      if (Provider.of<MapProvider>(context, listen: false).deliveryStage ==
          DeliveryStage.nearDeliveryDestination) {
        // Future.delayed(const Duration(seconds: 2));
        Provider.of<MapProvider>(context, listen: false)
            .updateStage(DeliveryStage.deliveredPackage);
        Provider.of<MapProvider>(context, listen: false).deliveredTime =
            DateTime.now();

        Future.delayed(const Duration(seconds: 2)).then((value) {
          Provider.of<MapProvider>(context, listen: false)
              .updateStage(DeliveryStage.done);
        });
      }
      t.cancel();
    }

    LatLng? newPos;
    if (i > 0.9) {
      newPos = LatLng(toLat, toLong);
      if (Provider.of<MapProvider>(context, listen: false).deliveryStage ==
          DeliveryStage.pickedUpDelivery) {
        Provider.of<MapProvider>(context, listen: false)
            .updateStage(DeliveryStage.nearDeliveryDestination);
      }
    } else {
      final v = i;
      double lng = v * toLong + (1 - v) * fromLong;
      double lat = v * toLat + (1 - v) * fromLat;
      newPos = LatLng(lat, lng);
    }
    Marker newMarker = Marker(
        markerId: const MarkerId("driverMarker"),
        position: newPos,
        icon: BitmapDescriptor.fromBytes(
            await getBytesFromAsset('assets/icons/driver.png', 65)),
        draggable: false);
    _markers.add(newMarker);
    mapMarkerSink.add(_markers);

    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: newPos,
      zoom: 14,
    )));
  });
}
