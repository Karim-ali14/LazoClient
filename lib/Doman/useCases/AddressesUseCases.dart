
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import '../../Data/Network/lib/api.dart';

class FetchAddressesUseCase extends StateNotifier<StateModel<ShowAddresses200Response?>>{
  final AddressesApi api;
  FetchAddressesUseCase(this.api): super(StateModel());

  void fetchAddresses() async {
    state = StateModel.loading();
    request(() => api.showAddresses());
  }
}

class FetchAreasUseCase extends StateNotifier<StateModel<ShowAreas200Response?>>{
  final AddressesApi api;
  FetchAreasUseCase(this.api): super(StateModel());

  void fetchAddresses() async {
    state = StateModel.loading();
    request(() => api.showAreas());
  }
}

class CreateAddressUseCase extends StateNotifier<StateModel<CreateAddress200Response?>>{
  final AddressApi api;
  CreateAddressUseCase(this.api): super(StateModel());

  void createAddresses({ String? recipientName, String? recipientPhone, String? recipientLandmark, String? recipientAddress, String? lat, String? lng, String? cityId, }) async {
    state = StateModel.loading();
    request(() => api.createAddress(recipientName: recipientName, recipientPhone: recipientPhone, recipientLandmark: recipientLandmark, recipientAddress: recipientAddress, lat: lat, lng: lng, cityId: cityId,));
  }
}
class UpdateAddressUseCase extends StateNotifier<StateModel<UpdateAddress200Response?>>{
  final AddressApi api;
  UpdateAddressUseCase(this.api): super(StateModel());

  void updateAddresses({ String? addressId, String? recipientName, String? recipientPhone, String? recipientLandmark, String? recipientAddress, String? lat, String? lng, String? cityId, }) async {
    state = StateModel.loading();
    request(() => api.updateAddress(addressId: addressId, recipientName: recipientName, recipientPhone: recipientPhone, recipientLandmark: recipientLandmark, recipientAddress: recipientAddress, lat: lat, lng: lng, cityId: cityId,));
  }
}

class DeleteAddressUseCase extends StateNotifier<StateModel<void>>{
  final AddressApi api;
  DeleteAddressUseCase(this.api): super(StateModel());

  void fetchAddresses({ String? addressId, }) async {
    state = StateModel.loading();
    request(() => api.clientAddressDeleteDelete(addressId: addressId,));
  }
}