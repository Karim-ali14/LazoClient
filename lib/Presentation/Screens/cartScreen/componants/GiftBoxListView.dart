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

typedef OnItemSelected = Function(GiftBox?);

class GiftBoxListView extends ConsumerStatefulWidget {
  final OnItemSelected onItemSelected;
  const GiftBoxListView(this.onItemSelected, {super.key});

  @override
  ConsumerState<GiftBoxListView> createState() => _GiftBoxListViewState();
}

class _GiftBoxListViewState extends ConsumerState<GiftBoxListView> {
  int? selectedIndex; // Track the index of the selected item

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      ref.read(fetchAllGiftBoxStateNotifies.notifier).fetchAllGiftBox();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var giftBox = ref.watch(fetchAllGiftBoxStateNotifies);

    return ListView.builder(
      itemCount: giftBox.data?.data.length ?? 0,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
          child: Skeletonizer(
            enabled: giftBox.state == DataState.LOADING,
            child: GiftItemView(
              type: GiftItemType.Box,
              giftBox: giftBox.data?.data[index],
              isSelected: selectedIndex == index,
              onItemSelected: () {
                setState(() {
                  if (selectedIndex != index){
                    widget.onItemSelected.call(giftBox.data?.data[index]);
                    selectedIndex = index; // Update selected index
                  }else {
                    selectedIndex = null;
                    widget.onItemSelected.call(null);
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
