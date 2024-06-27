import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_client/main.dart';

import '../../Constants.dart';
import '../../Localization/Keys.dart';

class LoginUseCase extends StateNotifier<StateModel<ClientLogin200Response>> {
  final Ref ref;
  final AuthApi authApi;
  LoginUseCase(this.ref, this.authApi) : super(StateModel());

  void login(String phone) async {
    state = StateModel.loading();
    request(() => authApi.clientLogin(phone: phone), onComplete:(res) {
      ref.read(clientStateProvider.notifier).setUser(res.data);
    });
  }
}


class SendOtpUseCase extends StateNotifier<StateModel<CodeSendResponse>>{
  final Ref ref;
  final PublicAuthApi authApi;
  SendOtpUseCase( this.ref, this.authApi):super(StateModel());

  void sendOtp(String? phone) async {
    state = StateModel.loading();
    request(() => authApi.codeSendPost(emailOrPhone: phone,accountType : accountType));
  }
}

class ConfirmResetCodeUseCase extends StateNotifier<StateModel<Object>>{
  final Ref ref;
  final PublicAuthApi authApi;
  ConfirmResetCodeUseCase( this.ref, this.authApi):super(StateModel());

  void confirmReset(String? emailOrPhone,String? code) async {
    state = StateModel.loading();
    request(() => authApi.resetCodeConfirmPost(emailOrPhone: emailOrPhone,confirmCode: code ,accountType : accountType));
  }
}

class UploadFilesUseCase extends StateNotifier<StateModel<Object>>{
  final Ref ref;
  final PublicApi publicApi;
  UploadFilesUseCase( this.ref, this.publicApi):super(StateModel());

  void uploadFilesPost(MultipartFile? filesLeftSquareBracket0RightSquareBracket) async {
    state = StateModel.loading();
    request(() => publicApi.uploadFilesPost());
  }
}




class UserProvider extends StateNotifier<ClientLogin200ResponseData?> {
  final Ref ref;
  UserProvider(this.ref) : super(null);

  ClientLogin200ResponseData? checkIfUserExist() {
    ClientLogin200ResponseData? user = prefs.getString(userKey) != null
        ? ClientLogin200ResponseData.fromJson(
            json.encode(prefs.getString(userKey) ?? ""))
        : null;
    if (user != null) {
      ref.read(apiClient).defaultHeaderMap.update(
          "Authorization", (value) => "Bearer ${user.accessToken}",
          ifAbsent: () => "Bearer ${user.accessToken}");
    }
    return user;
  }

  void setUser(ClientLogin200ResponseData? user){
    state = user;
    prefs.setString(userKey, json.encode(user?.toJson()));
    ref.read(apiClient).defaultHeaderMap.update(
        "Authorization", (value) => "Bearer ${user?.accessToken}",
        ifAbsent: () => "Bearer ${user?.accessToken}");
  }

  Future<bool> logout() async{
    state = null;
    await prefs.remove(userKey);
    return true;
  }
}
