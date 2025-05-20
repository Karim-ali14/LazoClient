import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';

import '../../Constants.dart';
import '../../Data/Network/lib/api.dart';

class MapViewContainer extends StatefulWidget {
  final LatLng? selectedLocation;
  final City? city;
  final Function(LatLng) onMapSelectedLocation;
  const MapViewContainer(
      {super.key,
      this.city,
      required this.onMapSelectedLocation,
      this.selectedLocation});

  @override
  State<MapViewContainer> createState() => _MapViewContainerState();
}

class _MapViewContainerState extends State<MapViewContainer> {
  late GoogleMapController mapController;
  LatLng? selectedLocation;
  Set<Marker> _markers = {};

  @override
  void initState() {
    selectedLocation = widget.selectedLocation;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      width: double.infinity,
      height: 147.h,
      child: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: selectedLocation ??
                  LatLng(double.parse(widget.city?.lat ?? "0.0"),
                      double.parse(widget.city?.lng ?? "0.0")),
              zoom: 12.0,
            ),
            markers: _markers,
            myLocationEnabled: false, // Enable user's location
          ),
          Align(
            alignment: Alignment.center,
            child: InkWell(
              onTap: () {
                navigateToSelectLocationScreen();
              },
              child: Container(
                width: 230.h,
                height: 40.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppTheme.mainAppColorLight2,
                ),
                child: const Center(
                  child: Text(
                    "Select Location",
                    style: AppTheme
                        .styleWithTextMainAppColorDarkAdelleSansFonts17w500,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (selectedLocation != null || widget.city != null) {
    mapController.animateCamera(CameraUpdate.newLatLng(selectedLocation ??
        LatLng(double.parse(widget.city?.lat ?? "0.0"),
            double.parse(widget.city?.lng ?? "0.0"))));
    }
  }

  void navigateToSelectLocationScreen() async {
    var location = await context.push(R_GoogleMapScreen,
            extra: {"locationSelected": selectedLocation, "city": widget.city})
        as LatLng?;
    if (location != null) {
      widget.onMapSelectedLocation(location);

      setState(() {
        _markers = {
          Marker(
            markerId: const MarkerId('1'),
            position: location,
          ),
        };
        selectedLocation = location;
      });
      mapController.animateCamera(CameraUpdate.newLatLng(location));
    }
  }
}
