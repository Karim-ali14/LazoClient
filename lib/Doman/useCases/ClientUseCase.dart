import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import '../../Constants/Eunms.dart';
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
    String? latLng,
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
        latLng: latLng,
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
    String? deliveryDate,
    String? deliveryTime,
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
        cardTo: cardTo,deliveryDate: deliveryDate,deliveryTime: deliveryTime));
  }
}

class OrderUseCase extends StateNotifier<StateModel<ShowOrders200Response?>> {
  final Ref ref;
  final ClientApi api;
  final MainOrderStatus orderState;
  OrderUseCase(this.orderState, this.ref, this.api) : super(StateModel());

  void getOrders({int? page = 1}) async {
    state = page != 1
        ? StateModel(data: state.data, state: DataState.MORE_LOADING)
        : StateModel.loading();
    requestForPagination(
        () => api.showOrders(status: orderState.name.toLowerCase(), page: page),
        onComplete: (res) {
      print(
          "getOrders Size for $orderState ${orderState.name} ${res?.data?.data.isEmpty}");
      if (page != 1) {
        List<ClientOrderDetails> data = state.data?.data?.data ?? [];
        state.data?.data?.data = [...data, ...(res?.data?.data ?? [])];
        state = StateModel.success(state.data);
      } else {
        state = StateModel.success(res);
      }

      if (state.data?.data?.data.isEmpty == true) {
        state = StateModel.empty();
      }
    });
  }

  void updateList(ClientOrderDetails order) {
    List<ClientOrderDetails> data = state.data?.data?.data ?? [];
    state.data?.data?.data = [
      ...data,
      ...([order])
    ];
    state = StateModel.success(state.data);
  }

  void updateOrder(ClientOrderDetails order) {
    List<ClientOrderDetails> data = state.data?.data?.data ?? [];
    var indexWhere = data.indexWhere((item) => item.id == order.id);
    data[indexWhere] = order;
    state.data?.data?.data = [...data];
    state = StateModel.success(state.data);
  }

  void deleteOrder(ClientOrderDetails order) {
    try {
      List<ClientOrderDetails> data =
          (state.data?.data?.data ?? []).toList(growable: true);
      print(data.length);
      var index = data.indexWhere((item) => item.id == order.id);
      print(index);
      data.removeAt(index);
      print(data.length);

      state.data?.data?.data = data;
      if (data.isNotEmpty) {
        state = StateModel.success(state.data);
      } else {
        state = StateModel.empty(data: null);
      }
    } catch (e) {
      print(e);
    }
  }
}

class ManageOrderUseCase
    extends StateNotifier<StateModel<ClientOrderDetailsResponse?>> {
  final Ref ref;
  final ClientApi api;
  ManageOrderUseCase(this.ref, this.api) : super(StateModel());

  void updateOrderState({
    String? orderId,
    String? statusId,
  }) {
    state = StateModel.loading();
    request(() => api.manageOrder(orderId: orderId, statusId: statusId));
  }
}

class OrderDetailsUseCase
    extends StateNotifier<StateModel<ClientOrderDetailsResponse?>> {
  final Ref ref;
  final ClientApi api;
  OrderDetailsUseCase(this.ref, this.api) : super(StateModel());

  void getOrderDetails({String? orderId}) {
    state = StateModel.loading();
    request(() => api.showOrderDetails(orderId: orderId));
  }

  void updateOrderDetails({ClientOrderDetails? order}) {
    var data = state.data;
    data?.data = order;
    state = StateModel.success(data);
  }
}

class CalculateInstantOrderUseCase
    extends StateNotifier<StateModel<CreatInstantOrder200Response?>> {
  final Ref ref;
  final ClientApi api;
  CalculateInstantOrderUseCase(this.ref, this.api) : super(StateModel());

  void calculateInstantOrder({
    String? serviceId,
    String? serviceQuantity,
    String? serviceSelectedListIds,
    String? serviceSelectedListItemsIds,
    String? promocode,
  }) {
    print(
        "asdfasdfasdf serviceid: $serviceId , serviceSelectedListIds $serviceSelectedListIds serviceSelectedListItemsIds $serviceSelectedListItemsIds");
    state = StateModel.loading();
    request(() => api.calculateInstantOrder(
        serviceId: serviceId,
        serviceQuantity: serviceQuantity,
        serviceSelectedListIds: serviceSelectedListIds,
        serviceSelectedListItemsIds: serviceSelectedListItemsIds));
  }

  void updateOrderDetails({ClientOrderDetails? order}) {
    var data = state.data;
    data?.data = order;
    state = StateModel.success(data);
  }
}
