import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapStatics {
  static const driverInitialLocation = CameraPosition(
    target: LatLng(25.139548262239185, 55.20341862868266),
    zoom: 14,
  );

  static const pickUpLocation = CameraPosition(
    target: LatLng(25.17038910419408, 55.22770812819449),
    zoom: 14,
  );
  static const destinationLocation = CameraPosition(
    target: LatLng(25.23883354406637, 55.27190352524151),
    zoom: 14,
  );
}
