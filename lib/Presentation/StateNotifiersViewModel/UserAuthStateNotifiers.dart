import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';

import '../../Data/Models/StateModel.dart';
import '../../Data/Network/lib/api.dart';
import '../../Doman/useCases/AuthUaseCases.dart';

final loginStateNotifierProvider =
    StateNotifierProvider.autoDispose<LoginUseCase, StateModel<ClientLogin200Response>>(
        (ref) => LoginUseCase(ref, ref.read(clientAuthApi)));

final sendOtpStateProvider = StateNotifierProvider.autoDispose<SendOtpUseCase,StateModel<Object>>((ref) => SendOtpUseCase(ref, ref.read(publicAuthApi)));
final confirmResetCodeStateProvider = StateNotifierProvider.autoDispose<ConfirmResetCodeUseCase,StateModel<Object>>((ref) => ConfirmResetCodeUseCase(ref, ref.read(publicAuthApi)));

final clientStateProvider = StateNotifierProvider<UserProvider,ClientLogin200ResponseData?>((ref) => UserProvider(ref));

