import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart" as latLng;
import 'package:google_maps_flutter/google_maps_flutter.dart';
class MyMaps extends StatefulWidget {
  @override
  _State createState() => new _State();
}
//AIzaSyBN2qkY3uLmzozhTURyQAAt6IC3bLv3Uqg
class _State extends State<MyMaps> {
  Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar:  AppBar(
          title: const Text('Maps In Flutter'),
          backgroundColor: const Color(0xffeae4e9),
        ),
        body:GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
        floatingActionButton:  FloatingActionButton.extended(
          onPressed: _goToTheLake,
          label:  Text('To the lake!'),
          icon:  Icon(Icons.directions_boat),
        ),
      ),
    );
  }
  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

}

