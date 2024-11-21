import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../Utils/LocationHandler.dart';
import '../../Utils/PermissionsHandler.dart';

class GoogleMapScreen extends StatefulWidget {
  final LatLng? locationSelected;
  const GoogleMapScreen({super.key, this.locationSelected});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  final Completer<GoogleMapController> controller = Completer();

  CameraPosition currentLocation = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 11);
  Position? _currentPosition;
  LatLng? _currentLatLng;
  Marker? _marker;

  void _onMapCreated(GoogleMapController _controller) {
    controller.complete(_controller);
    // Listen to camera movements
    if (widget.locationSelected != null) {
      _controller.animateCamera(CameraUpdate.newLatLng(
        widget.locationSelected!
      ));
    }else {
      _getLocation();
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            initialCameraPosition: currentLocation,
            markers: _marker != null ? {_marker!} : {},
            // onCameraIdle: _onCameraIdle, // Use this callback
            onCameraMove: _onCameraUpdate,
          ),
          _currentLatLng != null ?Align(
            alignment: AlignmentDirectional.topEnd,
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: InkWell(
                  onTap: () {
                    context.pop(_currentLatLng);
                  },
                  child: Text(
                    "Done",
                    style: AppTheme
                        .styleWithTextBlackAdelleSansExtendedFonts16w500,
                  )),
            ),
          ) : SizedBox()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getLocation,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        backgroundColor: Colors.green,
        child: const Icon(Icons.map, size: 36.0),
      ),
    );
  }

  /*void _onCameraIdle() async {
    // Get the current map controller and update the marker's position
    var _controller = controller.future;

    _controller.then((controller) {
      controller.getVisibleRegion().then((bounds) {
        print("{bounds.northeast}");
        // if (_marker != null) {
        //   initOrUpdateMarker(bounds.northeast);
        // }
      });
    });
  }*/

  void _getLocation() async {
    if (await PermissionsHandler.checkLocationPermission()) {
      var position = await LocationHandler.getCurrentLocation();
      _currentLatLng = LatLng(position!.latitude, position.longitude);
      moveCamera(position);
      initOrUpdateMarker(_currentLatLng!);
    } else {}
  }

  void moveCamera(Position position) async {
    var _controller = await controller.future;
    _controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude), zoom: 15)));
  }

  void initOrUpdateMarker(LatLng position) {
    setState(() {
      if (_marker == null) {
        _marker = Marker(
          markerId: MarkerId('currentLocation'),
          position: position,
        );
      } else {
        _marker = _marker!.copyWith(positionParam: position);
      }
    });
  }

  void _onCameraUpdate(CameraPosition position) {
    _currentLatLng = position.target;
    initOrUpdateMarker(position.target);
    print("${position.target}");
  }
}
