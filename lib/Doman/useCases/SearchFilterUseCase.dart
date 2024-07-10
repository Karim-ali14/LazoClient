
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Data/Models/ItemSelector.dart';

class SearchFilterUseCase extends StateNotifier<List<ItemSelector>>{

  SearchFilterUseCase():super([]);

  void updateList(List<ItemSelector> list){
      state = list;
  }

}