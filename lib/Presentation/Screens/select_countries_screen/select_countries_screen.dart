import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
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
import '../../../Utils/HalperMethods.dart';

class SelectCountriesScreen extends ConsumerStatefulWidget {
  const SelectCountriesScreen({super.key});

  @override
  ConsumerState<SelectCountriesScreen> createState() =>
      _SelectCountriesScreenState();
}

class _SelectCountriesScreenState extends ConsumerState<SelectCountriesScreen> {
  Country? countrySelected ;
  City? citySelected;
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
              height: MediaQuery.of(context).size.height * 0.2,
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
                      isSelect: countrySelected?.id == country?.id,
                      icon: country?.flag ?? "",
                      onPress: (countryId) {
                        setState(() {
                          countrySelected = country;
                          citySelected = null; // Reset city on country change
                        });
                        ref
                            .read(getCities.notifier)
                            .getCities(countryId: countrySelected?.id.toString());
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
                    const Padding(
                      padding: EdgeInsets.all(16.0),
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
                          var city = citiesState.data?.data[index];
                          return Skeletonizer(
                            enabled: citiesState.state == DataState.LOADING,
                            child: PlaceItem(
                              id: city?.id ?? 0,
                              isSelect: citySelected?.id == city?.id,
                              title: "${city?.name}",
                              icon: null,
                              onPress: (cityId) {
                                setState(() {
                                  citySelected = city;
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
              enabled: countrySelected != null && citySelected != null,
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
    saveCountrySelected(countrySelected);
    saveCitySelected(citySelected);
  }

  void navigateToHomeScreen() {
    if (countrySelected != null && citySelected != null) {
      prefs.setBool(selectedCityKey, true);
      context.go(R_MainScreen);
    }
  }
}
