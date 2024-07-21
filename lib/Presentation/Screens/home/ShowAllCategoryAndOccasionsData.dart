import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/EmptyDataView.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../Constants/Eunms.dart';
import '../../../Data/Network/lib/api.dart';
import '../../Widgets/CategoryItemCart.dart';
import '../../Widgets/SearchWithFilter.dart';

class ShowAllCategoryAndOccasionsData extends ConsumerStatefulWidget {
  final CategoryType type;
  const ShowAllCategoryAndOccasionsData(this.type, {super.key});

  @override
  ConsumerState<ShowAllCategoryAndOccasionsData> createState() =>
      _ShowAllCategoryAndOccasionsDataState();
}

class _ShowAllCategoryAndOccasionsDataState
    extends ConsumerState<ShowAllCategoryAndOccasionsData> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timestamp) {
      if (widget.type == CategoryType.Categories) {
        ref.read(getCategoriesDataStateNotifiers.notifier).getCategoriesData();
      } else if (widget.type == CategoryType.Occasions) {
        ref.read(getOccasionsDataStateNotifiers.notifier).getOccasionsData();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    final categoryState = ref.watch(getCategoriesDataStateNotifiers);

    final occasionsState = ref.watch(getOccasionsDataStateNotifiers);

    final double itemHeight = 154;

    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title:
            widget.type == CategoryType.Categories ? "Categories" : "Occasions",
        navigated: true,
        isCenter: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: AppSearchBarWithFilter(
                hasFilter: false,
                onFilterClick: () {},
                onTextChangeListener: (value) {
                  print(value);
                  if (widget.type == CategoryType.Categories) {
                    ref
                        .read(getCategoriesDataStateNotifiers.notifier)
                        .searchInMainList(value);
                  } else {
                    ref
                        .read(getOccasionsDataStateNotifiers.notifier)
                        .searchInMainList(value);
                  }
                },
              ),
            ),
            Container(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: (itemWidth / itemHeight),
                controller: ScrollController(keepScrollOffset: false),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: widget.type == CategoryType.Categories
                    ? categoryState.state == DataState.SUCCESS
                        ? categoryState.data?.data.map((Category value) {
                              return Padding(
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 6, vertical: 6),
                                child: CategoryItemCart(
                                  image: value.imagePath ?? "",
                                  title: value.name ?? "",
                                  height: 156,
                                ),
                              );
                            }).toList() ??
                            [
                              EmptyDataView(
                                title: "No Data Found",
                                description:
                                    "Please refine your search using common words to get accurate results",
                              )
                            ]
                        : [
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                          ].map((String value) {
                            return Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 6, vertical: 6),
                              child: SizedBox(
                                height: 10,
                                width: 50,
                                child: Skeletonizer(
                                  enabled: true,
                                  child: CategoryItemCart(
                                    image: "",
                                    title: "",
                                    height: 156,
                                    width: itemWidth,
                                  ),
                                ),
                              ),
                            );
                          }).toList()
                    : occasionsState.state == DataState.SUCCESS
                        ? occasionsState.data?.data.map((Occasion value) {
                              return Padding(
                                padding: const EdgeInsetsDirectional.symmetric(
                                    horizontal: 6, vertical: 6),
                                child: CategoryItemCart(
                                  image: value.imagePath ?? "",
                                  title: value.name ?? "",
                                  height: 156,
                                ),
                              );
                            }).toList() ??
                            [
                              EmptyDataView(
                                title: "No Data Found",
                                description:
                                    "Please refine your search using common words to get accurate results",
                              )
                            ]
                        : [
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                            "",
                          ].map((String value) {
                            return Padding(
                              padding: const EdgeInsetsDirectional.symmetric(
                                  horizontal: 6, vertical: 6),
                              child: Skeletonizer(
                                enabled: true,
                                child: CategoryItemCart(
                                  image: "",
                                  title: "",
                                  height: 156,
                                  width: itemWidth,
                                ),
                              ),
                            );
                          }).toList(),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
