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
    String? receiverName,
    String? receiverAddress,
    String? receiverAddressDetails,
    String? receiverPhone,
  }) {
    state = StateModel.loading();
    request(() => _clientApi.createOrder(
        deliveryDate: deliveryDate,
        deliveryTime: deliveryTime,
        giftBoxId: giftBoxId,
        giftCardId: giftCardId,
        isIdentitySecret: isIdentitySecret,
        orderType: orderType,
        paymentMethod: paymentMethod,
        promocode: promocode,
        receiverName: receiverName,
        receiverPhone: receiverPhone,
        receiverAddress: receiverAddress,
        receiverAddressDetails: receiverAddressDetails));
  }

  void createInstantOrder({
    String? serviceId,
    String? serviceQuantity,
    String? serviceSelectedListIds,
    String? serviceSelectedListItemsIds,
    String? paymentMethod,
    String? promocode,
    String? receiverName,
    String? receiverPhoneNumber,
    String? cardMessage,
    String? cardFrom,
    String? cardTo,
  }) {
    state = StateModel.loading();
    request(() => _clientApi.creatInstantOrder(
      serviceId: serviceId,
      serviceQuantity: serviceQuantity,
      serviceSelectedListIds: serviceSelectedListIds,
      serviceSelectedListItemsIds: serviceSelectedListItemsIds,
      paymentMethod: paymentMethod,
      promocode: promocode,
      receiverName: receiverName,
      receiverPhoneNumber: receiverPhoneNumber,
      cardMessage: cardMessage,
      cardFrom: cardFrom,
      cardTo: cardTo
    ));
  }
}
