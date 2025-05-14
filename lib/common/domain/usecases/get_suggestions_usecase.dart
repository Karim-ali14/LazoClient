import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Data/Models/StateModel.dart';
import '../repositories/common_repository.dart';


class GetSuggestionsUseCase extends StateNotifier<StateModel<List<dynamic>>> {
  final CommonRepository _commonRepository;

  GetSuggestionsUseCase(this._commonRepository) : super(StateModel());

  Future<void> call(String input) async {
    state = StateModel.loading();

    try {
      final suggestions = await _commonRepository.getSuggestions(input);
      state = StateModel(
        state: DataState.SUCCESS,
        data: suggestions,
      );
    } catch (e) {
      state = StateModel(
        state: DataState.ERROR  ,
        message: e.toString(),
      );
    }
  }

  void clearSuggestions(){
    state = StateModel.success([]);
  }
}
