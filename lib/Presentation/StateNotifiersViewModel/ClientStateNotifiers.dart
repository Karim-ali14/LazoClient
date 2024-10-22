import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Doman/useCases/ClientUseCase.dart';
import '../../Data/Network/lib/api.dart';

final createOrderStateNotifiers =
    StateNotifierProvider<CreateOrderUseCase, StateModel<ClientOrderDetails?>>(
        (ref) => CreateOrderUseCase(ref, ref.read(clientApi)));
