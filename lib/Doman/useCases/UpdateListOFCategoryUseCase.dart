
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Utils/CategoryUtils.dart';

class UpdateListOfCategoryUseCase extends StateNotifier<List<Category>>{
  UpdateListOfCategoryUseCase():super([]);
  void updateState(List<Category> newState){
    state = [];
    state = newState;
  }

  void toggleSelection(num? categoryId,bool isChecked) {
    state = state.map((category) {
      if (category.id == categoryId) {
        return category.copyWith(isChecked: isChecked);
      }
      return category;
    }).toList();
  }


  void removeSelected(num? categoryId) {
    state = state.map((category) {
      if (category.id == categoryId) {
        return category.copyWith(isChecked: false);
      }
      return category;
    }).toList();
  }

  void clearAll() {
    state = state.map((category) => category.copyWith(isChecked: false)).toList();
  }
}