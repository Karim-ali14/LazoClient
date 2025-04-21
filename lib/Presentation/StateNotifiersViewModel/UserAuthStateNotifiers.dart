import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';

import '../../Data/Models/StateModel.dart';
import '../../Data/Network/lib/api.dart';
import '../../Doman/useCases/AuthUaseCases.dart';

final loginStateNotifierProvider = StateNotifierProvider.autoDispose<
        LoginUseCase, StateModel<ClientAuthResponse>>(
    (ref) => LoginUseCase(ref, ref.read(clientAuthApi)));

final signUpStateNotifierProvider = StateNotifierProvider.autoDispose<
        SignUpUseCase, StateModel<ClientAuthResponse>>(
    (ref) => SignUpUseCase(ref, ref.read(clientAuthApi)));

final sendOtpForLoginStateProvider = StateNotifierProvider.autoDispose<SendOtpUseCase,
        StateModel<CodeSendResponse>>(
    (ref)  =>SendOtpUseCase(ref, ref.read(publicAuthApi)));

final sendOtpForSignUpStateProvider = StateNotifierProvider.autoDispose<SendOtpUseCase,
        StateModel<CodeSendResponse>>(
    (ref) => SendOtpUseCase(ref, ref.read(publicAuthApi)));

final confirmResetCodeStateProvider = StateNotifierProvider.autoDispose<
        ConfirmResetCodeUseCase, StateModel<CodeConfirmResponse?>>(
    (ref) => ConfirmResetCodeUseCase(ref, ref.read(publicAuthApi)));

final clientStateProvider =
    StateNotifierProvider<UserProvider, ClientAuthResponseData?>(
        (ref) => UserProvider(ref));

final deleteAccountStateProvider =
    StateNotifierProvider.autoDispose<DeleteAccountUseCase, StateModel<void>>(
        (ref) => DeleteAccountUseCase(ref,ref.read(clientApi)));

final logoutStateProvider =
    StateNotifierProvider.autoDispose<LogoutUseCase, StateModel<void>>(
        (ref) => LogoutUseCase(ref,ref.read(clientApi)));

final updateProfileStateProvider =
    StateNotifierProvider.autoDispose<UpdateProfileUseCase, StateModel<ClientAuthResponse>>(
        (ref) => UpdateProfileUseCase(ref,ref.read(clientApi)));


