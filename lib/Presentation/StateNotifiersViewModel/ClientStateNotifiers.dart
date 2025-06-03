import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Doman/useCases/ClientUseCase.dart';
import '../../Constants/Eunms.dart';
import '../../Data/Network/lib/api.dart';

final createOrderStateNotifiers =
    StateNotifierProvider.autoDispose<CreateOrderUseCase, StateModel<ClientOrderDetailsResponse?>>(
        (ref) => CreateOrderUseCase(ref, ref.read(clientApi)));

final getNewOrderStateProvider = StateNotifierProvider.autoDispose<OrderUseCase,
    StateModel<ShowOrders200Response?>>(
        (ref) => OrderUseCase(MainOrderStatus.Pending, ref, ref.read(clientApi)));

final getCurrentOrderStateProvider = StateNotifierProvider.autoDispose<
    OrderUseCase, StateModel<ShowOrders200Response?>>(
        (ref) => OrderUseCase(MainOrderStatus.Completed, ref, ref.read(clientApi)));

// final getFinishOrderStateProvider = StateNotifierProvider.autoDispose<
//     OrderUseCase, StateModel<ShowOrders200Response?>>(
//         (ref) => OrderUseCase(MainOrderStatus.Finished, ref, ref.read(clientApi)));
//
// final getCanselOrderStateProvider = StateNotifierProvider.autoDispose<
//     OrderUseCase, StateModel<ShowOrders200Response?>>(
//         (ref) => OrderUseCase(MainOrderStatus.Cancelled, ref, ref.read(clientApi)));

final manageOrderStateProvider = StateNotifierProvider.autoDispose<
    ManageOrderUseCase, StateModel<ClientOrderDetailsResponse?>>(
        (ref) => ManageOrderUseCase(ref, ref.read(clientApi)));

final getOrderDetailsStateProvider = StateNotifierProvider.autoDispose<
    OrderDetailsUseCase, StateModel<ClientOrderDetailsResponse?>>(
        (ref) => OrderDetailsUseCase(ref, ref.read(clientApi)));

final ratingOrderStateProvider = StateNotifierProvider.autoDispose<
    RatingOrderUseCase, StateModel<ClientOrderDetailsResponse?>>(
        (ref) => RatingOrderUseCase(ref, ref.read(clientApi)));

final calculateInstantOrderStateProvider = StateNotifierProvider.autoDispose<
    CalculateInstantOrderUseCase, StateModel<ClientOrderDetailsResponse?>>(
        (ref) => CalculateInstantOrderUseCase(ref, ref.read(clientApi)));

final updateFcmTokenStateProvider = StateNotifierProvider.autoDispose<
    UpdateFcmTokenUseCase, StateModel<void>>(
        (ref) => UpdateFcmTokenUseCase(ref, ref.read(clientApi)));


