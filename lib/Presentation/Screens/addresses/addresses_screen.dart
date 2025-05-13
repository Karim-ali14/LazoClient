import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Constants.dart';
import 'package:lazo_client/Presentation/Screens/addresses/componants/address_card.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/EmptyDataPlaceHolder.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';

import '../../../Constants/Assets.dart';
import '../../StateNotifiersViewModel/AddressStateNotifiers.dart';
import '../../Theme/AppTheme.dart';
import '../../Widgets/AppButton.dart';

class AddressesScreen extends ConsumerStatefulWidget {
  const AddressesScreen({super.key});

  @override
  ConsumerState<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends ConsumerState<AddressesScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(fetchAddressStateNotifiers.notifier).fetchAddresses();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final addresses = ref.watch(fetchAddressStateNotifiers);
    return
      Scaffold(
            appBar: CustomAppBar(
              title: "Addresses",
              appContext: context,
              navigated: true,
              isCenter: false,
            ),
            body: addresses.data?.data.isEmpty == true ? Expanded(
              child: EmptyDataPlaceHolder(
                onAddOrderClick: () {},
                icon: SVGIcons.localSVG(addressPlaceHolderIcons,width: 113.w,height: 94.h),
                title: "",
                description: "You haven’t added any delivery\n addresses yet",
                buttonName: "Add Address",
                showButton: true,
              ),
            ): Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  AppButton(
                      width: double.infinity,
                      height: 48.h,
                      text: "Add Address",
                      backColor: AppTheme.mainAppColorDark,
                      outlined: true,
                      onPress: () {
                        navigateToAddAddressScreen();
                      }),
                  const Padding(
                    padding:  EdgeInsets.symmetric(vertical: 16),
                    child: Divider(
                      thickness: 1,
                      height: 1,
                      color: AppTheme.appGrey11,
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ...(List.generate(addresses.data?.data.length ?? 0, (index) => AddressCard(addressItem: addresses.data?.data[index],)))
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
  }

  void navigateToAddAddressScreen() {
    context.push(R_AddAddressScreen);
  }
}
