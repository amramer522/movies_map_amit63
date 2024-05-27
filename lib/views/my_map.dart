import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class MyMapView extends StatefulWidget {
  const MyMapView({super.key});

  @override
  State<MyMapView> createState() => _MyMapViewState();
}

class _MyMapViewState extends State<MyMapView> {
  Set<Marker> markers = {};
  String address = "";
  LatLng? currentLocation;
  final  completer = Completer<GoogleMapController>();
  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    final location = await Geolocator.getCurrentPosition();
    List<Placemark> marks =
    await placemarkFromCoordinates(location.latitude, location.longitude);
    print("*******");
    print(marks.first.country);
    print(marks.first.name);
    print(marks.first.administrativeArea);
    print(marks.first.locality);
    print(marks.first.postalCode);
    print(marks.first.street);
    print(marks.first.thoroughfare);
    address =
    "${marks.first.country} - ${marks.first.administrativeArea} - ${marks.first.locality}";

    markers.add(Marker(
      markerId: MarkerId("location"),
      position: LatLng(location.latitude, location.longitude),
    ));
    currentLocation= LatLng(location.latitude, location.longitude);
    setState(() {});
    final mapController = await completer.future;
    await mapController.animateCamera(CameraUpdate.newLatLng(currentLocation!));

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: address.isNotEmpty
          ? AppBar(
              title: Text("$address"),
            )
          : null,
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
          final mapController = await completer.future;
          await mapController.animateCamera(CameraUpdate.newLatLng(LatLng(37, 122)));
        },
      ),
      body: SafeArea(
        child: currentLocation == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GoogleMap(
                markers: markers,
                onMapCreated: (controller) {
                  completer.complete(controller);
                },
                onTap: (location) async {
                  List<Placemark> marks =
                      await placemarkFromCoordinates(location.latitude, location.longitude);
                  print("*******");
                  print(marks.first.country);
                  print(marks.first.name);
                  print(marks.first.administrativeArea);
                  print(marks.first.locality);
                  print(marks.first.postalCode);
                  print(marks.first.street);
                  print(marks.first.thoroughfare);
                  address =
                      "${marks.first.country} - ${marks.first.administrativeArea} - ${marks.first.locality}";

                  markers.add(Marker(
                    markerId: MarkerId("location"),
                    position: location,
                  ));

                  setState(() {});
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(29.97996590776044, 31.133755347034022),
                  zoom: 13,
                ),
              ),
      ),
    );
  }
}
