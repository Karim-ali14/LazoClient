import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Screens/addresses/componants/phone_with_country_code_for_address.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/AddressStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:lazo_client/Utils/LocationHandler.dart';
import 'package:lazo_client/main.dart';

import '../../../Constants.dart';
import '../../../Constants/Assets.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/AppButton.dart';

class AddAddressScreen extends ConsumerStatefulWidget {
  final AddressItem? addressItem;
  final bool? isEdit;
  const AddAddressScreen({super.key, this.addressItem, this.isEdit = false});

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
  String? code;
  LatLng? _selectedLocation;
  Set<Marker> _markers = {};

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      print(widget.isEdit.toString());
      if (widget.isEdit == true) {
        nameController.text = widget.addressItem?.recipientName ?? "";
        phoneController.text = widget.addressItem?.recipientPhone?.split(" ").last ?? "";
        code = widget.addressItem?.recipientPhone?.split(" ").first ?? "";
        addressController.text = widget.addressItem?.recipientLandmark ?? "";
        additionalAddressController.text =
            widget.addressItem?.recipientAddress ?? "";
        _selectedLocation = LatLng(double.parse(widget.addressItem?.lat ?? "0"),
            double.parse(widget.addressItem?.lng ?? "0"));
        _markers = {
          Marker(
            markerId: const MarkerId('1'),
            position: _selectedLocation!,
          ),
        };

      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    handleState(createAddressStateNotifiers, showLoading: true,
        onSuccess: (res) {
      ref.read(fetchAddressStateNotifiers.notifier).fetchAddresses();
      context.pop();
    });
    handleState(updateAddressStateNotifiers, showLoading: true,onSuccess: (res){
      ref.read(fetchAddressStateNotifiers.notifier).fetchAddresses();
      context.pop();
    });
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: widget.isEdit == true ? "Edit Address" : "Add Address",
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
                      initCodeValue: widget.addressItem?.recipientPhone?.split(" ").first ?? "",
                      onSelectCountryCode: (value) {
                        code = value;
                      },
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
                              _selectedLocation ?? const LatLng(37.7749, -122.4194),
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
                          hintText: "Recipient Address *",
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
            decoration: const BoxDecoration(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
            child: AppButton(
              height: 48,
              text: "Save Address",
              onPress: () {
                if (widget.isEdit == false) {
                  createAddress();
                }else{
                  editAddress();
                }
              },
            ),
          ),
        )
      ]),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    if (_selectedLocation != null) {
      mapController.animateCamera(CameraUpdate.newLatLng(_selectedLocation!));
    }
  }

  void createAddress() async {
    if (formKey.currentState!.validate() && _selectedLocation != null) {
      var address =
          await LocationHandler.getAddressFromLatLng(_selectedLocation!);
      ref.read(createAddressStateNotifiers.notifier).createAddresses(
          recipientName: nameController.text,
          recipientPhone: phoneController.text.removeFirstChar("+"),
          recipientLandmark: address,
          recipientAddress: additionalAddressController.text,
          lat: "${_selectedLocation!.latitude}",
          lng: "${_selectedLocation!.longitude}",
          cityId: "9");
    }
  }

  void editAddress() async{
    if (formKey.currentState!.validate() && _selectedLocation != null) {
      var address =
          await LocationHandler.getAddressFromLatLng(_selectedLocation!);
      ref.read(updateAddressStateNotifiers.notifier).updateAddresses(
          recipientName: nameController.text,
          recipientPhone: "$code ${phoneController.text.removeFirstChar(" + ")}",
          recipientLandmark: address,
          recipientAddress: additionalAddressController.text,
          lat: "${_selectedLocation!.latitude}",
          lng: "${_selectedLocation!.longitude}",
          cityId: "9",addressId: widget.addressItem?.id.toString());
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
