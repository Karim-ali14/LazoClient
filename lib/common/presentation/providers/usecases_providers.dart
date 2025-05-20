
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../Data/Models/AddressModel.dart';
import '../../../Data/Models/StateModel.dart';
import '../../domain/providers/common_repository_providers.dart';
import '../../domain/usecases/get_place_details_from_latlng_usecase.dart';
import '../../domain/usecases/get_place_details_usecase.dart';
import '../../domain/usecases/get_suggestions_usecase.dart';

final getSuggestionsUseCaseProvider = StateNotifierProvider.autoDispose<
    GetSuggestionsUseCase, StateModel<List<dynamic>>>((ref) {
  final repo = ref.read(commonRepoProvider);
  return GetSuggestionsUseCase(repo);
});

final getLatLngFromPlaceIdUseCaseProvider = StateNotifierProvider.autoDispose<
    GetLatLngFromPlaceIdUseCase, StateModel<Address?>>((ref) {
  return GetLatLngFromPlaceIdUseCase(ref.read(commonRepoProvider));
});

final getAddressFromLatLngUseCaseProvider = StateNotifierProvider.autoDispose<
    GetLatLngFromLatLngUseCase, StateModel<Address?>>((ref) {
  return GetLatLngFromLatLngUseCase(ref.read(commonRepoProvider));
});


