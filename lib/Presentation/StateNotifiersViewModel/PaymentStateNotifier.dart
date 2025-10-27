import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';

import '../../Data/Models/StateModel.dart';
import '../../Data/Network/lib/api.dart';

class VerifyOrderUseCase
    extends StateNotifier<StateModel<PaymentVerifyResponse?>> {
  final Ref _ref;
  final PaymentApi _paymentApi;

  VerifyOrderUseCase(this._ref, this._paymentApi) : super(StateModel());

  void paymentVerify({
    required String resourcePath,
    required String paymentBrand,
  }) {
    state = StateModel.loading();
    requestWithHandleMessage(
        () => _paymentApi.paymentVerifyGet(resourcePath, paymentBrand));
  }
}

final verifyOrderUseCaseStateNotifier = StateNotifierProvider<
        VerifyOrderUseCase, StateModel<PaymentVerifyResponse?>>(
    (ref) => VerifyOrderUseCase(ref, ref.read(paymentApi)));
