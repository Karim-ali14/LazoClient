import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> controller = Completer();

  final CameraPosition currentLocation = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 11);

  void _onMapCreated(GoogleMapController _controller) {
    controller.complete(_controller);
  }

  String _permissionStatus = "Unknown";

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    // Check the status of the location permission
    PermissionStatus status = await Permission.location.status;

    if (status.isGranted) {
      setState(() {
        _permissionStatus = "Location Permission Granted";
      });
    } else if (status.isDenied) {
      // Request the permission
      if (await Permission.location.request().isGranted) {
        setState(() {
          _permissionStatus = "Location Permission Granted";
        });
      } else {
        setState(() {
          _permissionStatus = "Location Permission Denied";
        });
      }
    } else if (status.isPermanentlyDenied) {
      setState(() {
        _permissionStatus = "Location Permission Permanently Denied";
      });
      // Direct the user to app settings to enable permissions
      openAppSettings();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
          onMapCreated: _onMapCreated, initialCameraPosition: currentLocation),
      // floatingActionButton: ,
    );
  }
}
