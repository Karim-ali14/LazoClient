import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';

import '../../Data/Network/lib/api.dart';
import '../../Doman/useCases/WishListUseCases.dart';

final productToggleStateNotifier = StateNotifierProvider.autoDispose<
        ToggleProductServiceInWishlistUseCase,
        StateModel<ToggleProductServiceInWishlist200Response>>(
    (ref) => ToggleProductServiceInWishlistUseCase(ref, (ref.read(clientApi))));

final serviceToggleStateNotifier = StateNotifierProvider.autoDispose<
        ToggleProductServiceInWishlistUseCase,
        StateModel<ToggleProductServiceInWishlist200Response>>(
    (ref) => ToggleProductServiceInWishlistUseCase(ref, (ref.read(clientApi))));
