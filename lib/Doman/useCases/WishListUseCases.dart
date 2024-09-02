import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';

import '../../Data/Models/StateModel.dart';
import '../../Data/Network/lib/api.dart';

class ToggleProductServiceInWishlistUseCase extends StateNotifier<
    StateModel<ToggleProductServiceInWishlist200Response>> {
  final Ref ref;
  final ClientApi clientApi;
  ToggleProductServiceInWishlistUseCase(this.ref, this.clientApi)
      : super(StateModel());

  void toggle({
    String? productId,
    String? serviceId,
  }) {
    state = StateModel.loading();
    request(() => clientApi.toggleProductServiceInWishlist(
        productId: productId, serviceId: serviceId));
  }
}
