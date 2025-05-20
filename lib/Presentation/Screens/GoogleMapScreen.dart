import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator_platform_interface/src/models/position.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import '../../Constants/Assets.dart';
import '../../Constants/Constants.dart';
import '../../Data/Network/lib/api.dart';
import '../../Localization/Keys.dart';
import '../../Utils/HalperMethods.dart';
import '../../Utils/LocationHandler.dart';
import '../../Utils/PermissionsHandler.dart';
import '../../common/presentation/providers/usecases_providers.dart';
import '../Widgets/SearchWithFilter.dart';

class GoogleMapScreen extends ConsumerStatefulWidget {
  final LatLng? locationSelected;
  const GoogleMapScreen({super.key, this.locationSelected});

  @override
  ConsumerState<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends ConsumerState<GoogleMapScreen> {
  final Completer<GoogleMapController> controller = Completer();
  GoogleMapController? _mapController;
  CameraPosition currentLocation = CameraPosition(
      target: LatLng(37.42796133580664, -122.085749655962), zoom: 11);
  Position? _currentPosition;
  LatLng? _currentLatLng;
  Marker? _marker;
  final _controller = TextEditingController();
  String selectedCityName = "";
  City? city;
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

  final ValueNotifier<Map<String, String>> addressInfo =
      ValueNotifier({"": ""});
  final ValueNotifier<bool> insideArea = ValueNotifier(false);
  @override
  void initState() {
    initCity();
    super.initState();
  }

  LatLng? _lastCameraPosition;
  Map<String, String> locationIndo = {};
  @override
  Widget build(BuildContext context) {
    final suggestionsState = ref.watch(getSuggestionsUseCaseProvider);

    handleState(getLatLngFromPlaceIdUseCaseProvider, onSuccess: (res) {
      if (res.data != null) {
        _currentLatLng =
            LatLng(res.data?.latitude ?? 0.0, res.data?.longitude ?? 0.0);
        moveCamera(_currentLatLng ?? const LatLng(0.0, 0.0));
        clearSuggestion();
      }
    });

    handleState(getAddressFromLatLngUseCaseProvider, showLoading: true,
        onSuccess: (res) {
      if (res.data != null) {
        print("asdfasdfasdd ${res.data?.description}");
        context.pop(res.data);
      }
    });

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

                print("selectedCityName :${selectedCityName.toLowerCase()} ${cityInfo?.keys.first.toLowerCase()}");
                if (cityInfo?.keys.first.toLowerCase().startsWith(selectedCityName.toLowerCase()) ==
                    true) {
                  addressInfo.value = cityInfo!;
                  insideArea.value = true;
                } else {
                  addressInfo.value = {"": ""};
                  insideArea.value = false;
                }
              }
            },
          ),
          Align(
              alignment: Alignment.topCenter,
              child: Container(
                  width: double.infinity,
                  height:
                      suggestionsState.data?.isNotEmpty == true ? 380.h : 55.h,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          AppSearchBarWithFilter(
                            hasFilter: false,
                            enableSearch: true,
                            delay: 1,
                            controller: _controller,
                            onTextChangeListener: _onSearchChanged,
                            onFilterClick: () {},
                          ),
                          Align(
                            alignment: AlignmentDirectional.centerEnd,
                            child: InkWell(
                              onTap: () {
                                _getLocation();
                              },
                              child: Container(
                                  height: 40.h,
                                  width: 60.h,
                                  child: const Center(
                                      child: Text(
                                    "Locate Me",
                                    style: AppTheme
                                        .styleWithTextRedAdelleSansExtendedFonts12w400,
                                  ))),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height:
                            suggestionsState.data?.isNotEmpty == true ? 300 : 0,
                        child: ListView.builder(
                          itemCount: suggestionsState.data?.length,
                          itemBuilder: (context, index) {
                            final suggestion = suggestionsState.data?[index];
                            return ListTile(
                              title: Text(suggestion?['description']),
                              onTap: () {
                                _controller.text = suggestion?['description']
                                        .toString()
                                        .ellipsize(35) ??
                                    "";
                                print(suggestion);
                                _onSuggestionTap(suggestion?['place_id']);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ))),
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
                            builder: (context, inArea, _) {
                              return SizedBox(
                                height: 38.h,
                                child: inArea
                                    ? Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SVGIcons.localSVG(
                                              addressLocationIconSvg,
                                              width: 24,
                                              height: 24),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          ValueListenableBuilder(
                                              valueListenable: addressInfo,
                                              builder: (context, value, _) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      value.values.first
                                                              .ellipsize(35) ??
                                                          "",
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
                                              }),
                                        ],
                                      )
                                    : SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                10,
                                        height: 35.h,
                                        child: Text(
                                          "Sorry! We currently deliver in Riyadh only. Stay tuned for more cities soon!",
                                          style: AppTheme
                                              .styleWithTextBlack2AdelleSansExtendedFonts14w400,
                                        )),
                              );
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        ValueListenableBuilder(
                            valueListenable: insideArea,
                            builder: (context, value, _) {
                              return AppButton(
                                enabled: value,
                                width: double.infinity,
                                backColor: AppTheme.mainAppColorDark,
                                text: "Confirm Location",
                                height: 56.h,
                                onPress: () {
                                  context.pop(_currentLatLng);
                                },
                              );
                            }),
                      ],
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
    );
  }

  void _onSuggestionTap(String placeId) {
    ref.read(getLatLngFromPlaceIdUseCaseProvider.notifier).call(placeId);
  }

  void _onSearchChanged(String input) async {
    ref.read(getSuggestionsUseCaseProvider.notifier).clearSuggestions();
    ref.read(getSuggestionsUseCaseProvider.notifier).call(input);
  }

  void clearSuggestion() {
    ref.read(getSuggestionsUseCaseProvider.notifier).clearSuggestions();
  }

  void _getLocation() async {
    if (await PermissionsHandler.checkLocationPermission()) {
      var position = await LocationHandler.getCurrentLocation();
      _currentLatLng = LatLng(position!.latitude, position.longitude);
      moveCamera(_currentLatLng!);
      initOrUpdateMarker(_currentLatLng!);
    } else {}
  }

  void moveCamera(LatLng location) async {
    var _controller = await controller.future;
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: location, zoom: 15),
      ),
    );
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

  void initCity() async {
    city = await getObject<City>(
            citySelectedKey, (json) => City.fromJson(json) ?? City()) ??
        City();
    print("selectedCityName : $city");
   var map = await LocationHandler.getAddressInfo(
      double.parse(city?.lat ?? "0"),
      double.parse(city?.lng ?? "0"),
    );
    selectedCityName = map?.keys.first ?? "";
  }
}
