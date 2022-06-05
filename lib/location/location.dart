import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PolylineTwoScreen extends StatefulWidget {
  const PolylineTwoScreen({Key? key}) : super(key: key);

  @override
  _PolylineTwoScreenState createState() => _PolylineTwoScreenState();
}

class _PolylineTwoScreenState extends State<PolylineTwoScreen> {
  Completer<GoogleMapController> _controller = Completer();

  CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(27.708586796981226, 85.32572390827158),
    zoom: 16,
  );
  static const LatLng _center =
      const LatLng(27.708586796981226, 85.32572390827158);
  final Set<Marker> _markers = {};
  final Set<Polyline> _polyline = {};

//add your lat and lng where you wants to draw polyline
  LatLng _lastMapPosition = _center;

  List<LatLng> latlng = [
    LatLng(27.708568479950777, 85.3259431344048),
    LatLng(27.709829972541215, 85.32617091723118),
    LatLng(27.709880139863028, 85.32643933460338),
    LatLng(27.70955316238823, 85.32782115233792),
    LatLng(27.7104673325929, 85.32810578887538),
    LatLng(27.711046183943775, 85.32820684968465),
    LatLng(27.712202116030294, 85.3286021308811),
    LatLng(27.712663261408032, 85.32869662937253),
    LatLng(27.71221067685726, 85.33079663041265),
  ];

  List a = [
    LatLng(27.708568479950777, 85.3259431344048),
    LatLng(27.709829972541215, 85.32617091723118),
    LatLng(27.709880139863028, 85.32643933460338),
    LatLng(27.70955316238823, 85.32782115233792),
    LatLng(27.7104673325929, 85.32810578887538),
    LatLng(27.711046183943775, 85.32820684968465),
    LatLng(27.712202116030294, 85.3286021308811),
    LatLng(27.712663261408032, 85.32869662937253),
    LatLng(27.71221067685726, 85.33079663041265),
    LatLng(27.71055858851605, 85.32851773165751),
    LatLng(27.709423631809543, 85.3266310424869),
    LatLng(27.709412392028053, 85.32726583321012),
    LatLng(27.70996126844965, 85.32803604600309),
    LatLng(27.71089070430019, 85.32828223564799),
    LatLng(27.71176721189894, 85.32882863737682),
    LatLng(27.712454631168427, 85.32931517288921),
    LatLng(27.713062761782982, 85.32833385434985),
  ];

  List b = [
    "Starting - Islington College",
    "Right Turn from temple",
    "Straight from City Centre",
    "Left Turn to Thirbum Marg",
    "Straight to Thirbum Marg",
    "Straight to Mega Bank Nepal",
    "Straight to Bhagawati Marg",
    "Right Turn ",
    "Destination (Herald College)",
    "himal hospital",
    "City Centre",
    "Kripi Girls Hostel",
    "Tawa Multi Cuisine",
    "Everest Momo Center",
    "OYO Hotel",
    "Adapt Clothing Store",
    "Hotel Crown Plaza"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    for (int i = 0; i < latlng.length; i++) {
      setState(() {
        // _markers.add(Marker(
        //   // This marker id can be anything that uniquely identifies each marker.
        //   markerId: MarkerId(i.toString()),
        //   //_lastMapPosition is any coordinate which should be your default
        //   //position when map opens up
        //   position: latlng[i],
        //   infoWindow: InfoWindow(
        //     title: b[i],
        //     // snippet: '5 Star Rating',
        //   ),
        //   icon: BitmapDescriptor.defaultMarker,
        // ));
        _polyline.add(Polyline(
          polylineId: PolylineId(i.toString()),
          visible: true,
          //latlng is List<LatLng>
          points: latlng,
          //  points: latlng[i],

          color: Color.fromARGB(255, 33, 243, 68),
        ));
      });
    }
    for (int j = 0; j < a.length; j++) {
      setState(() {
        _markers.add(Marker(
          // This marker id can be anything that uniquely identifies each marker.
          markerId: MarkerId(j.toString()),
          //_lastMapPosition is any coordinate which should be your default
          //position when map opens up
          position: a[j],
          infoWindow: InfoWindow(
            title: b[j],
            // snippet: '5 Star Rating',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(),
          body: GoogleMap(
            //that needs a list<Polyline>

            polylines: _polyline,
            markers: _markers,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            myLocationEnabled: true,
            // onCameraMove: _onCameraMove,
            initialCameraPosition: _kGooglePlex,

            mapType: MapType.hybrid,
          )),
    );
  }
}
