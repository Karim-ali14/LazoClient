import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Data/Models/AddressModel.dart';
import '../../../Data/Models/StateModel.dart';
import '../repositories/common_repository.dart';

class GetLatLngFromPlaceIdUseCase extends StateNotifier<StateModel<Address?>> {
  final CommonRepository _commonRepository;

  GetLatLngFromPlaceIdUseCase(this._commonRepository) : super(StateModel());

  Future<void> call(String placeId) async {
    state = StateModel.loading();

    try {
      final location = await _commonRepository.getLatLngFromPlaceId(placeId);
      state = StateModel(
        state: DataState.SUCCESS,
        data: location,
      );
    } catch (e) {
      state = StateModel(
        state: DataState.ERROR,
        message: e.toString(),
      );
    }
  }

}

