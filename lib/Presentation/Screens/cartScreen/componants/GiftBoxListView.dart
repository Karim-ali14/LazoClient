import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../Constants/Eunms.dart';
import '../../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import 'GiftItemView.dart';

class GiftBoxListView extends ConsumerStatefulWidget {
  const GiftBoxListView({super.key});

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
          child: GiftItemView(
            type: GiftItemType.Box,
            giftBox: giftBox.data?.data[index],
            isSelected: selectedIndex == index,
            onItemSelected: () {
              setState(() {
                if (selectedIndex != index){
                  selectedIndex = index; // Update selected index
                }else
                  selectedIndex = null;
              });
              print(selectedIndex.toString());
            },
          ),
        );
      },
    );
  }
}
