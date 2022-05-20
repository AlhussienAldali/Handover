import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:handover/core/ui_and_statics/map_statics.dart';
import 'package:handover/core/utils/utils.dart';
import 'package:handover/features/delivery_tracker/provider/map_provider.dart';
import 'package:handover/features/delivery_tracker/widgets/delivery_time_line.dart';
import 'package:handover/features/simulation/movement_simulation.dart';
import 'package:handover/features/simulation/notification_simulation.dart';
import 'package:provider/provider.dart';
import 'package:workmanager/workmanager.dart';

class DeliveryMap extends StatefulWidget {
  const DeliveryMap({Key? key}) : super(key: key);

  @override
  _DeliveryMapState createState() => _DeliveryMapState();
}

class _DeliveryMapState extends State<DeliveryMap> {
  final List<Marker> _markers = <Marker>[];

  GoogleMapController? _controller;

  final _mapMarkerSC = StreamController<List<Marker>>();

  StreamSink<List<Marker>> get _mapMarkerSink => _mapMarkerSC.sink;

  Stream<List<Marker>> get mapMarkerStream => _mapMarkerSC.stream;

  @override
  void initState() {
    setUpMarker();

    //simulate the notification in the background
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      Workmanager().initialize(callbackDispatcher);
      await Workmanager().registerOneOffTask("taskZero", "Notification",
          inputData: {"notificationNumber": 0},
          initialDelay: const Duration(seconds: nearPickUpNotificationTime));
      await Workmanager().registerOneOffTask("taskOne", "Notification",
          inputData: {"notificationNumber": 1},
          initialDelay:
              const Duration(seconds: arrivedToPickUpNotificationTime));
      await Workmanager().registerOneOffTask("taskTwo", "Notification",
          inputData: {"notificationNumber": 2},
          initialDelay:
              const Duration(seconds: nearDeliveryDestinationNotificationTime));
      await Workmanager().registerOneOffTask("taskThree", "Notification",
          inputData: {"notificationNumber": 3},
          initialDelay: const Duration(
              seconds: arrivedToDeliveryDestinationNotificationTime));
    });

    //simulate the movement of the driver from his location to pick up location

    Future.delayed(const Duration(seconds: 3)).then((value) {
      simulateMarkerMovement(
        context,
        _markers,
        _controller,
        MapStatics.driverInitialLocation.target.latitude,
        MapStatics.driverInitialLocation.target.longitude,
        MapStatics.pickUpLocation.target.latitude,
        MapStatics.pickUpLocation.target.longitude,
        _mapMarkerSink,
      );
    });

    //simulate the movement of the driver from pick up location to destination location

    Future.delayed(const Duration(seconds: 40)).then((value) {
      Provider.of<MapProvider>(context, listen: false)
          .updateStage(DeliveryStage.pickedUpDelivery);
      Provider.of<MapProvider>(context, listen: false).pickUpTime =
          DateTime.now();

      simulateMarkerMovement(
        context,
        _markers,
        _controller,
        MapStatics.pickUpLocation.target.latitude,
        MapStatics.pickUpLocation.target.longitude,
        MapStatics.destinationLocation.target.latitude,
        MapStatics.destinationLocation.target.longitude,
        _mapMarkerSink,
      );
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Marker>>(
        stream: mapMarkerStream,
        builder: (context, snapshot) {
          return GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: MapStatics.driverInitialLocation,
            rotateGesturesEnabled: false,
            tiltGesturesEnabled: false,
            mapToolbarEnabled: false,
            myLocationEnabled: false,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onMapCreated: (GoogleMapController controller) {
              _controller = controller;
            },
            markers: Set<Marker>.of(snapshot.data ?? []),
            padding: const EdgeInsets.all(8),
          );
        });
  }

  setUpMarker() async {
    final pickupMarker = Marker(
      markerId: const MarkerId("pickupMarker"),
      position: LatLng(MapStatics.pickUpLocation.target.latitude,
          MapStatics.pickUpLocation.target.longitude),
      icon: BitmapDescriptor.fromBytes(
          await getBytesFromAsset('assets/icons/pickup.png', 50)),
    );
    final destinationMarker = Marker(
      markerId: const MarkerId("destinationMarker"),
      position: LatLng(MapStatics.destinationLocation.target.latitude,
          MapStatics.destinationLocation.target.longitude),
      icon: BitmapDescriptor.fromBytes(
          await getBytesFromAsset('assets/icons/destination.png', 50)),
    );

    //Adding a delay and then showing the marker on screen
    await Future.delayed(const Duration(milliseconds: 500));

    _markers.add(pickupMarker);
    _markers.add(destinationMarker);

    _mapMarkerSink.add(_markers);
  }
}
