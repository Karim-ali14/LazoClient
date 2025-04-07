
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/ItemSelector.dart';

class UpdateListOfFilterSelectedUseCase extends StateNotifier<List<ItemSelected?>>{
  UpdateListOfFilterSelectedUseCase():super([]);
  void updateState(List<ItemSelected?> items){
    state = [...items];
  }

  void addItem(ItemSelected item){
    state = [...state , item];
  }

  void removeItem(ItemSelected? itemSelected) {
    var list = state;
    print("asdfsadf ${state.length.toString()}");
    list.removeWhere((item) => itemSelected?.id == item?.id && itemSelected?.type == item?.type);
    print("asdfsadf ${state.length.toString()}");
    state = [...list];
  }

  void clearAll() {
    state = [];
  }
}