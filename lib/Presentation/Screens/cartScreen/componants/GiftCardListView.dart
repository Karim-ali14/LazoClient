import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Constants/Eunms.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'GiftItemView.dart';

typedef OnItemSelected = Function(GiftCard?);

class GiftCardListView extends ConsumerStatefulWidget {
  final OnItemSelected onItemSelected;
  final List<GiftCard>? data;
  final bool? isLoading;
  const GiftCardListView(this.onItemSelected, {this.data, this.isLoading,super.key});

  @override
  ConsumerState<GiftCardListView> createState() => _GiftBoxListViewState();
}

class _GiftBoxListViewState extends ConsumerState<GiftCardListView> {
  int? selectedIndex; // Track the index of the selected item

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemCount: widget.data?.length ?? 0,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
          child: Skeletonizer(
            enabled: widget.isLoading ?? false,
            child: GiftItemView(
              type: GiftItemType.Card,
              giftCard: widget.data?[index],
              isSelected: selectedIndex == index,
              onItemSelected: () {
                setState(() {
                  if (selectedIndex != index){
                    widget.onItemSelected.call(widget.data?[index]);
                    selectedIndex = index; // Update selected index
                  }else {
                    widget.onItemSelected.call(null);
                    selectedIndex = null;
                  }
                });
                print(selectedIndex.toString());
              },
            ),
          ),
        );
      },
    );
  }
}
