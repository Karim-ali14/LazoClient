import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Screens/addresses/componants/phone_with_country_code_for_address.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/AddressStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/LocationHandler.dart';
import 'package:lazo_client/main.dart';

import '../../../Constants.dart';
import '../../../Constants/Assets.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/AppButton.dart';

class AddAddressScreen extends ConsumerStatefulWidget {
  const AddAddressScreen({super.key});

  @override
  ConsumerState<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends ConsumerState<AddAddressScreen> {
  late GoogleMapController mapController;
  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final additionalAddressController = TextEditingController();
  final phoneController = TextEditingController();
  final ValueNotifier<bool> isCountryCodeEmpty = ValueNotifier(false);
  // Initial location for the map
  LatLng? _selectedLocation; // San Francisco
  Set<Marker> _markers = {};

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    handleState(createAddressStateNotifiers, showLoading: true,
        onSuccess: (res) {
      ref.read(fetchAddressStateNotifiers.notifier).fetchAddresses();
      context.pop();
    });
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: "Add Address",
        navigated: true,
        isCenter: false,
      ),
      body: Stack(children: [
        Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Please ensure all the below details are accurate.",
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts14w400,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      cursorColor: AppTheme.blackColor2,
                      decoration: const InputDecoration(
                          hintText: "Recipient Name *",
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: AppTheme.appGrey6,
                          ))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    PhoneFieldWithCountryCodeForAddress(
                      phoneController: phoneController,
                      isCountryCodeEmpty: isCountryCodeEmpty,
                      onSelectCountryCode: (value) {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      width: double.infinity,
                      height: 147.h,
                      child: GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target:
                              _selectedLocation ?? LatLng(37.7749, -122.4194),
                          zoom: 12.0,
                        ),
                        markers: _markers,
                        myLocationEnabled: true, // Enable user's location
                        onTap: (pos) {
                          navigateToSelectLocationScreen();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: addressController,
                      keyboardType: TextInputType.text,
                      cursorColor: AppTheme.blackColor2,
                      decoration: const InputDecoration(
                          hintText: "Recipient Address*",
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: AppTheme.appGrey6,
                          ))),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: additionalAddressController,
                      cursorColor: AppTheme.blackColor2,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: "Additional Address Details",
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: AppTheme.appGrey6,
                          ))),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: AppButton(
              height: 48,
              text: "Save Address",
              onPress: () {
                createAddress();
              },
            ),
          ),
        )
      ]),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void createAddress() async {
    if (formKey.currentState!.validate() && _selectedLocation != null) {
      var address =
          await LocationHandler.getAddressFromLatLng(_selectedLocation!);
      ref.read(createAddressStateNotifiers.notifier).createAddresses(
            recipientName: nameController.text,
            recipientPhone: phoneController.text,
            recipientLandmark: address,
            recipientAddress: additionalAddressController.text,
            lat: "${_selectedLocation!.latitude}",
            lng: "${_selectedLocation!.longitude}",
            cityId: "9"
          );
    }
  }

  void navigateToSelectLocationScreen() async {
    var location = await context.push(R_GoogleMapScreen,
        extra: {"locationSelected": _selectedLocation}) as LatLng?;
    if (location != null) {
      print(location);
      addressController.text =
          await LocationHandler.getAddressFromLatLng(location);

      setState(() {
        _markers = {
          Marker(
            markerId: const MarkerId('1'),
            position: location,
          ),
        };
        _selectedLocation = location;
      });
      mapController.animateCamera(CameraUpdate.newLatLng(location));
    }
  }
}
