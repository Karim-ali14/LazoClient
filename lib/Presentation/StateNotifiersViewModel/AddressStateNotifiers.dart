import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import '../../Data/Models/StateModel.dart';
import '../../Data/Network/lib/api.dart';
import '../../Doman/useCases/AddressesUseCases.dart';

final fetchAddressStateNotifiers = StateNotifierProvider.autoDispose<
    FetchAddressesUseCase, StateModel<ShowAddresses200Response?>>(
  (ref) => FetchAddressesUseCase(ref.read(addressesApi)));

final createAddressStateNotifiers = StateNotifierProvider.autoDispose<
    CreateAddressUseCase, StateModel<CreateAddress200Response?>>(
  (ref) => CreateAddressUseCase(ref.read(addressApi)));

final deleteAddressStateNotifiers = StateNotifierProvider.autoDispose<
    DeleteAddressUseCase, StateModel<void>>(
  (ref) => DeleteAddressUseCase(ref.read(addressApi),ref));

final updateAddressStateNotifiers = StateNotifierProvider.autoDispose<
    UpdateAddressUseCase, StateModel<UpdateAddress200Response?>>(
  (ref) => UpdateAddressUseCase(ref.read(addressApi)));
