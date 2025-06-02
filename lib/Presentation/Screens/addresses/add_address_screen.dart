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
import '../../../Localization/Keys.dart';
import '../../../Utils/HalperMethods.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/AppButton.dart';
import '../../Widgets/map_view_container.dart';

class AddAddressScreen extends ConsumerStatefulWidget {
  final AddressItem? addressItem;
  final bool? isEdit;

  const AddAddressScreen({super.key, this.addressItem, this.isEdit = false});

  @override
  ConsumerState<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends ConsumerState<AddAddressScreen> {
  final ValueNotifier<String> codeNotifier = ValueNotifier("");
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

  City? city;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      initCity();
      print(widget.isEdit.toString());
      if (widget.isEdit == true) {
        nameController.text = widget.addressItem?.recipientName ?? "";
        phoneController.text = widget.addressItem?.recipientPhone?.split(" ").last ?? "";
        codeNotifier.value = widget.addressItem?.recipientPhone?.split(" ").first ?? "";
        addressController.text = widget.addressItem?.recipientAddress ?? "";
        additionalAddressController.text =
            widget.addressItem?.recipientLandmark ?? "";
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
                          )),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppTheme.appGrey20,
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
                      }, code: codeNotifier,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    MapViewContainer(onMapSelectedLocation: (location) {
                      _selectedLocation = location;
                      setAddressName(location);
                    }, city: city,selectedLocation: _selectedLocation,),
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
                          )),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppTheme.appGrey20,
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
                          )),
                          enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: AppTheme.appGrey20,
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

  void createAddress() async {
    if (formKey.currentState!.validate() && _selectedLocation != null) {
      var address =
          await LocationHandler.getAddressFromLatLng(_selectedLocation!);
      ref.read(createAddressStateNotifiers.notifier).createAddresses(
          recipientName: nameController.text,
          recipientPhone: '$code ${phoneController.text}'.removeFirstChar("+"),
          recipientLandmark: additionalAddressController.text,
          recipientAddress: address,
          lat: "${_selectedLocation!.latitude}",
          lng: "${_selectedLocation!.longitude}");
    }
  }

  void editAddress() async{
    if (formKey.currentState!.validate() && _selectedLocation != null) {
      var address =
          await LocationHandler.getAddressFromLatLng(_selectedLocation!);
      print(address);
      ref.read(updateAddressStateNotifiers.notifier).updateAddresses(
          recipientName: nameController.text,
          recipientPhone: "$code ${phoneController.text.removeFirstChar(" + ")}",
          recipientLandmark: additionalAddressController.text,
          recipientAddress: address,
          lat: "${_selectedLocation!.latitude}",
          lng: "${_selectedLocation!.longitude}",
          cityId: "9",addressId: widget.addressItem?.id.toString());
    }
  }
  void initCity() async {
    city = await getObject<City>(
        citySelectedKey, (json) => City.fromJson(json) ?? City()) ??
        City();
  }

  void setAddressName(LatLng location) async{
    addressController.text =
    await LocationHandler.getAddressFromLatLng(location);
  }

}
