import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Presentation/Screens/select_countries_screen/componants/place_item.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';
import 'package:lazo_client/Presentation/Widgets/AppButton.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/main.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Localization/Keys.dart';

class SelectCountriesScreen extends ConsumerStatefulWidget {
  const SelectCountriesScreen({super.key});

  @override
  ConsumerState<SelectCountriesScreen> createState() =>
      _SelectCountriesScreenState();
}

class _SelectCountriesScreenState extends ConsumerState<SelectCountriesScreen> {
  String countryId = "";
  String cityId = "";
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(fetchCountriesStateNotifier.notifier).fetchCountries();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final citiesState = ref.watch(getCities);
    return Scaffold(
      appBar: CustomAppBar(
          appContext: context, title: "", navigated: true, isCenter: false),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Send to",
              style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts18w700,
            ),
          ),
          Consumer(builder: (context, ref, child) {
            var countriesState = ref.watch(fetchCountriesStateNotifier);
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: countriesState.state == DataState.LOADING
                    ? 10
                    : countriesState.data?.data.length ?? 0,
                itemBuilder: (context, index) {
                  var country = countriesState.data?.data[index];
                  return Skeletonizer(
                    enabled: countriesState.state == DataState.LOADING,
                    child: PlaceItem(
                      id: country?.id ?? 0,
                      title: "${country?.name}",
                      isSelect: countryId == country?.id.toString(),
                      icon: country?.flag ?? "",
                      onPress: (country_id) {
                        setState(() {
                          countryId = country_id.toString();
                          cityId = ""; // Reset city on country change
                        });
                        ref
                            .read(getCities.notifier)
                            .getCities(countryId: countryId.toString());
                      },
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 1,
                  );
                },
              ),
            );
          }),
               citiesState.state == DataState.SUCCESS || citiesState.state == DataState.LOADING ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "Select City of delivery",
                        style: AppTheme
                            .styleWithTextBlackAdelleSansExtendedFonts18w700,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: citiesState.state == DataState.LOADING
                            ? 10
                            : citiesState.data?.data.length,
                        itemBuilder: (context, index) {
                          var cities = citiesState.data?.data[index];
                          return Skeletonizer(
                            enabled: citiesState.state == DataState.LOADING,
                            child: PlaceItem(
                              id: cities?.id ?? 0,
                              isSelect: cityId == cities?.id.toString(),
                              title: "${cities?.name}",
                              icon: null,
                              onPress: (city_id) {
                                setState(() {
                                  cityId = city_id.toString();
                                });
                              },
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ) : Container(),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: AppButton(
              width: double.infinity,
              enabled: countryId.isNotEmpty && cityId.isNotEmpty,
              text: "Continue",
                height: 48.h,
                onPress: (){
                savingData();
                navigateToHomeScreen();
            }),
          )
        ],
      ),
    );
  }

  void savingData() {
    prefs.setString(countryIdKey, countryId);
    prefs.setString(cityIdKey, cityId);
  }

  void navigateToHomeScreen() {
    if (countryId.isNotEmpty && cityId.isNotEmpty) {
      prefs.setBool(selectedCityKey, true);
      context.go(R_MainScreen);
    }
  }
}
