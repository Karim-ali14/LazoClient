import 'dart:convert';
import 'dart:io';
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/StateNotifiersViewModel/UserAuthStateNotifiers.dart';
import 'package:lazo_client/main.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../../Constants.dart';
import '../../Localization/Keys.dart';
import 'package:mime/mime.dart';

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

class UploadFilesUseCase extends StateNotifier<StateModel<UploadFilesResponse>>{
  final Ref ref;
  final PublicApi publicApi;
  UploadFilesUseCase( this.ref, this.publicApi):super(StateModel());

  void uploadFilesPost(List<File> files) async {
    state = StateModel.loading();
    var list = await filesToMultipart(files);
    request(() => publicApi.uploadFilesPost(filesLeftSquareBracket0RightSquareBracket: list.first),onComplete: (resp){
      print("File Response ${resp.data}");
    });
  }
}

Future<List<http.MultipartFile>> filesToMultipart(List<File> files) async {
  List<http.MultipartFile> multipartFiles = [];

  // Using Future.forEach to process files asynchronously
  await Future.forEach(files.asMap().entries, (MapEntry<int, File> entry) async {
    File file = entry.value;
    int index = entry.key;

    String fileName = file.path.split('/').last; // Get file name
    http.MultipartFile multipartFile = await http.MultipartFile.fromPath(
      'files[$index]', // This is the key to send, e.g., 'files[0]', 'files[1]', etc.
      file.path,
      contentType: MediaType(lookupMimeType(file.path)?.split("/").first ?? "", lookupMimeType(file.path)?.split("/").last ?? ""),
      filename: fileName,
    );
    multipartFiles.add(multipartFile);
  });

  return multipartFiles;
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
