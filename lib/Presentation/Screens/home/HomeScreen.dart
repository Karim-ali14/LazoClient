import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Presentation/Widgets/BannerCardItems.dart';
import 'package:lazo_client/Presentation/Widgets/CategoryItemCart.dart';
import 'package:lazo_client/Presentation/Widgets/SearchWithFilter.dart';
import 'package:lazo_client/Presentation/Widgets/SellerItemCard.dart';
import 'package:lazo_client/Presentation/Widgets/ServiceAndProductItemCard.dart';
import 'package:lazo_client/Presentation/Widgets/TitleWithSeeAll.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSearchBarWithFilter(hasFilter: false, onFilterClick: () {}),
              SizedBox(
                height: 24,
              ),
              BannerCardItems(list: [
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbWx68YZmV1xcoRW1iu-FOLm1GS_d3UbkwCw&usqp=CAU"
              ], height: 149, width: MediaQuery.of(context).size.width),
              SizedBox(
                height: 32,
              ),
              TitleWithSeeAll(
                title: "Categories",
                onClickOnSeeAll: () {},
              ),
              ServiceAndProductItemCardHorizontal()

            ],
          ),
        ),
      ),
    );
  }
}
