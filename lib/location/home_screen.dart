import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Completer<GoogleMapController> _controller = Completer();

  List<Marker> _markers = <Marker>[];

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.708586796981226, 85.32572390827158),
    zoom: 14,
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _markers.addAll(list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
          initialCameraPosition: _kGooglePlex,
          mapType: MapType.normal,
          zoomControlsEnabled: true,
          zoomGesturesEnabled: true,
          myLocationButtonEnabled: true,
          myLocationEnabled: true,
          trafficEnabled: false,
          rotateGesturesEnabled: true,
          buildingsEnabled: true,
          markers: Set<Marker>.of(_markers),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
        ),
      ),
    );
  }
}

List<Marker> list = const [
  Marker(
      markerId: MarkerId('1'),
      position: LatLng(27.708586796981226, 85.32572390827158),
      infoWindow: InfoWindow(title: 'Current Location')),
  Marker(
      markerId: MarkerId('2'),
      position: LatLng(27.70918570953192, 85.32602254709087),
      infoWindow: InfoWindow(title: 'Dulla The factory team')),
  Marker(
      markerId: MarkerId('3'),
      position: LatLng(27.709663494348987, 85.3268206266946),
      infoWindow: InfoWindow(title: 'City Centre')),
  Marker(
      markerId: MarkerId('4'),
      position: LatLng(27.70970180401042, 85.3275160228171),
      infoWindow: InfoWindow(title: 'Nepal Investment Bank ATM')),
  Marker(
      markerId: MarkerId('5'),
      position: LatLng(27.710147270744073, 85.32807661911298),
      infoWindow: InfoWindow(title: 'BYKS Pharma')),
  Marker(
      markerId: MarkerId('6'),
      position: LatLng(27.71087709485083, 85.32821222841821),
      infoWindow: InfoWindow(title: 'Everest Fast Food')),
  Marker(
      markerId: MarkerId('7'),
      position: LatLng(27.71224963751522, 85.32865879709972),
      infoWindow: InfoWindow(title: "Mega Bank")),
  Marker(
      markerId: MarkerId('8'),
      position: LatLng(27.71224963751522, 85.32865879709972),
      infoWindow: InfoWindow(title: "Himal Hospital")),
  Marker(
      markerId: MarkerId('9'),
      position: LatLng(27.711710044213376, 85.328856458938),
      infoWindow: InfoWindow(title: "OYO Hotel")),
  Marker(
      markerId: MarkerId('10'),
      position: LatLng(27.713067297891048, 85.32835839942756),
      infoWindow: InfoWindow(title: "Hotel Crown Plaza")),
  Marker(
      markerId: MarkerId('11'),
      position: LatLng(27.71224963751522, 85.32865879709972),
      infoWindow: InfoWindow(title: "Mega Bank")),
  Marker(
      markerId: MarkerId('12'),
      position: LatLng(27.712188875286444, 85.33056077572438),
      infoWindow: InfoWindow(title: "Destination (Herald Colleg)")),
];

// @override
// void initState() {
//   // TODO: implement initState
//   super.initState();
//   _markers.addAll(
//       list);
// }
