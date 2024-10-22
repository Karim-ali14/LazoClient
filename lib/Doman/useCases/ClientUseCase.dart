import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import '../../Data/Network/lib/api.dart';

class CreateOrderUseCase
    extends StateNotifier<StateModel<ClientOrderDetails?>> {
  final Ref _ref;
  final ClientApi _clientApi;
  CreateOrderUseCase(this._ref, this._clientApi) : super(StateModel());

  void createOrder({
    String? deliveryDate,
    String? deliveryTime,
    String? giftBoxId,
    String? giftCardId,
    String? isIdentitySecret,
    String? orderType,
    String? paymentMethod,
    String? promocode,
    String? receiverAddress,
    String? receiverAddressDetails,
    String? receiverPhone,
  }) {
    request(() => _clientApi.createOrder(
      deliveryDate: deliveryDate,
      deliveryTime: deliveryTime,
      giftBoxId: giftBoxId,
      giftCardId: giftCardId,
      isIdentitySecret : isIdentitySecret,
      orderType: orderType,
      paymentMethod: paymentMethod,
      promocode: promocode,
      receiverPhone: receiverPhone,
      receiverAddress: receiverAddress,
      receiverAddressDetails: receiverAddressDetails
    ));
  }
}
