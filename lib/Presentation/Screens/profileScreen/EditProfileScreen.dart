import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/AppTextField.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';
import 'package:lazo_client/Utils/ValidationEx.dart';
import 'package:lazo_client/main.dart';

import '../../../Constants/Constants.dart';
import '../../../Data/Models/ItemSelector.dart';
import '../../../Data/Network/lib/api.dart';
import '../../../Localization/Keys.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import '../../Widgets/CircleImagePicker.dart';
import '../Auth/Componants/CustomSelectorBottomSheet.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final fullNameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final cityController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  File? imageFile = null;
  List<City> cities = [];
  List<String> images = [];
  int? cityItemIdSelected;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((call) {
      setClientData(ref.watch(clientStateProvider));
      ref.read(getCities.notifier).getCities();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var client = ref.watch(clientStateProvider);
    handleState(getCities, onSuccess: (res) {
      cities = res.data?.data ?? [];
      var index = cities.indexWhere((city) => city.id == client?.client?.cityId);
      if(index != -1){
        cityItemIdSelected = cities[index].id;
      }
    });

    handleState(uploadFilesStateNotifiers, onSuccess: (res) {
      images = res.data?.data ?? [];
      editProfile(images.first);
    }, showLoading: true);

    handleState(updateProfileStateProvider, onSuccess: (res) {
      var client = ref.watch(clientStateProvider);
      client?.client = res.data?.data?.client;
      ref.read(clientStateProvider.notifier).setUser(client);
      context.pop(true);
    }, showLoading: true);

    return Scaffold(
      appBar: CustomAppBar(
          appContext: context,
          title: context.tr(editProfileKey),
          navigated: true,
          isCenter: false,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultPaddingHorizontal),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    textInputType: TextInputType.name,
                    textFieldBorderColor: AppTheme.appGrey3,
                    mode: AutovalidateMode.onUserInteraction,
                    hint: context.tr(fullNameKey),
                    label: context.tr(fullNameKey),
                    textEditingController: fullNameController,
                    validate: (value) {
                      if (value?.isEmpty == true) {
                        return context.tr(enterYourFullNameKey);
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: defaultPaddingHorizontal,
                  ),
                  AppTextField(
                    textInputType: TextInputType.emailAddress,
                    textFieldBorderColor: AppTheme.appGrey3,
                    mode: AutovalidateMode.onUserInteraction,
                    hint: context.tr(emailAddressOptionalKey),
                    label: context.tr(emailAddressOptionalKey),
                    textEditingController: emailController,
                    validate: (value){
                      if(value?.isNotEmpty == true && value?.isEmailValid == false) {
                        return 'Enter a valid email';
                      }else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: defaultPaddingHorizontal,
                  ),
                  AppTextField(
                    endWidget: InkWell(
                        onTap: () {
                          showCitesBottomSheet();
                        },
                        child: SVGIcons.bottomRedArrowIcon()),
                    readOnly: true,
                    textInputType: TextInputType.text,
                    textFieldBorderColor: AppTheme.appGrey3,
                    mode: AutovalidateMode.onUserInteraction,
                    hint: context.tr(chooseCityKey),
                    label: context.tr(chooseCityKey),
                    textEditingController: cityController,
                    validate: (value) {
                      if (value?.isEmpty == true) {
                        return context.tr(enterYourPhoneKey);
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: defaultPaddingHorizontal,
                  ),
                  AppButton(
                    width: context.getScreenSize.width,
                    height: 48,
                    onPress: () {
                      if (formKey.currentState?.validate() == true) {
                        if(imageFile != null){
                          uploadFiles();
                        }else{
                          editProfile(null);
                        }
                      }
                    },
                    child: Text(
                      "Save",
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts16w400
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  void showCitesBottomSheet() {
    showModalBottomSheet(
        context: context,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        builder: (BuildContext context) {
          return CustomSelectorBottomSheet(
              context: context,
              btuName: context.tr("Ok"),
              enableSearch: true,
              title: context.tr("chooseManufacturingYearsKey"),
              widgetList: cities
                  .map((e) => ItemSelector(e.id ?? 0, e.name ?? "", null))
                  .toList(),
              searchHint: "Search by",
              itemSelectedId: cityItemIdSelected,
              isSingleSelect: true,
              onSelectMultiItemsCallback: (items) {},
              onSelectItemCallback: (itemid) {
                cityItemIdSelected = itemid;

                if (cityItemIdSelected != null) {
                  cityController.text =
                      cities.firstWhere((item) => item.id == itemid).name ?? "";
                }

                Navigator.pop(context);
              });
        });
  }
  void setClientData(ClientAuthResponseData? client) {
    fullNameController.text = client?.client?.name ?? "";
    phoneController.text = client?.client?.phone ?? "";
    emailController.text = client?.client?.email ?? "";
    cityController.text = client?.client?.city?.name ?? "";
  }

  void uploadFiles() {
    ref.read(uploadFilesStateNotifiers.notifier).uploadFilesPost([imageFile!]);
  }

  void editProfile(String? imageLink) {
    ref.read(updateProfileStateProvider.notifier).updateProfile(
      cityId: cityItemIdSelected.toString() ,
      name: fullNameController.text ,
      email: emailController.text ,
      phone: phoneController.text,
      image: imageLink
    );
  }
}
