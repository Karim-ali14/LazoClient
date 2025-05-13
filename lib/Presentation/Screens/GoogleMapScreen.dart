import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import '../../Constants/Assets.dart';
import '../../Localization/Keys.dart';
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
  GoogleMapController? _mapController;
  CameraPosition currentLocation = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 11);
  Position? _currentPosition;
  LatLng? _currentLatLng;
  Marker? _marker;

  void _onMapCreated(GoogleMapController _controller) {
    controller.complete(_controller);
    _mapController = _controller;
    // Listen to camera movements
    if (widget.locationSelected != null) {
      _controller
          .animateCamera(CameraUpdate.newLatLng(widget.locationSelected!));
    } else {
      _getLocation();
    }
  }
  final ValueNotifier<Map<String, String>> addressInfo = ValueNotifier({"":""});
  final ValueNotifier<bool> insideArea = ValueNotifier(false);
  @override
  void initState() {
    super.initState();
  }

  LatLng? _lastCameraPosition;
  Map<String,String> locationIndo = {

  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: "",
        navigated: true,
        isCenter: false,
        trailingWidget: Container(
          padding: EdgeInsets.symmetric(horizontal: 0),
          width: 65.w,
          height: 25.h,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Center(
                child: Text(
              "Cancel",
              style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts16w500,
            )),
          ),
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            onMapCreated: _onMapCreated,
            initialCameraPosition: currentLocation,
            markers: _marker != null ? {_marker!} : {},
            // onCameraIdle: _onCameraIdle, // Use this callback
            onCameraMove: (CameraPosition position) {
              // Just save the position, don't update anything
              _lastCameraPosition = position.target;
            },
            onCameraIdle: () async {
              if (_lastCameraPosition != null) {
                _currentLatLng = _lastCameraPosition;
                initOrUpdateMarker(_currentLatLng!);

                var cityInfo = await LocationHandler.getAddressInfo(
                  _currentLatLng!.latitude,
                  _currentLatLng!.longitude,
                );

                if (cityInfo?.keys.first.toLowerCase().startsWith("cairo") == true) {
                  addressInfo.value = cityInfo!;
                  insideArea.value = true;
                } else {
                  addressInfo.value = {
                    "": ""
                  };
                  insideArea.value = false;
                }
              }
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              height: 67.h,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SVGIcons.localSVG(addressLocationIconSvg,
                      width: 24, height: 24),
                  SizedBox(
                    width: 8,
                  ),
                  ValueListenableBuilder(
                    valueListenable: addressInfo,
                    builder: (context,value,_) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            value.values.first.ellipsize(35) ?? "",
                            style: AppTheme
                                .styleWithTextGray18AdelleSansExtendedFonts12w400,
                          ),
                          Spacer(),
                          Text(
                           value.keys.first,
                            style: AppTheme
                                .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                          ),
                        ],
                      );
                    }
                  ),
                  Spacer(),
                  InkWell(
                      onTap: _getLocation,
                      child: const Text(
                        "Locate Me",
                        style: AppTheme
                            .styleWithTextAppRedColorAdelleSansExtendedFonts14w400,
                      ))
                ],
              ),
            ),
          ),
          _currentLatLng != null
              ? Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    height: 150.h,
                    width: double.infinity,
                    color: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    child: Column(
                      children: [
                        ValueListenableBuilder(
                            valueListenable: insideArea,
                            builder: (context,inArea,_) {
                            return SizedBox(
                              height: 35.h,
                              child:inArea ?Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SVGIcons.localSVG(addressLocationIconSvg,
                                      width: 24, height: 24),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  ValueListenableBuilder(
                                      valueListenable: addressInfo,
                                      builder: (context,value,_) {
                                        return Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              value.values.first.ellipsize(35) ?? "",
                                              style: AppTheme
                                                  .styleWithTextGray18AdelleSansExtendedFonts12w400,
                                            ),
                                            Spacer(),
                                            Text(
                                              value.keys.first,
                                              style: AppTheme
                                                  .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                            ),
                                          ],
                                        );
                                      }
                                  ),
                                ],
                              ):SizedBox(
                                  width: MediaQuery.of(context).size.width - 10,
                                  height: 35.h,
                                  child: Text("Sorry! We currently deliver in Riyadh only. Stay tuned for more cities soon!",style: AppTheme.styleWithTextBlack2AdelleSansExtendedFonts14w400,)),
                            );
                          }
                        ),
                        const SizedBox(height: 10,),
                        ValueListenableBuilder(
                          valueListenable: insideArea,
                          builder: (context,value,_) {
                            return AppButton(
                              enabled:value,
                              width: double.infinity,
                              backColor: AppTheme.mainAppColorDark,
                              text: "Confirm Location",
                              height: 56.h,
                              onPress: () {
                                context.pop(_currentLatLng);
                              },
                            );
                          }
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

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

  void _onCameraUpdate(CameraPosition position) async {
    _currentLatLng = position.target;
    initOrUpdateMarker(position.target);

  }
}
