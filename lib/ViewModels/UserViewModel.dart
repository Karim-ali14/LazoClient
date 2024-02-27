import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../../../../../Data/Models/ResponseModel.dart';
import '../../../../../Data/Providers/UserProvider.dart';
import '../../../../../Data/Repositories/UserRepository/UserRepository.dart';
import '../../../../../main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import '../Data/Models/StateModel.dart';
import '../Data/Models/User.dart';

class UserLogOutUseCase extends StateNotifier<StateModel<bool>>{
  final Ref ref;
  final UserRepository _userRepository;
  UserLogOutUseCase(this.ref, this._userRepository) : super(StateModel());

  void logout() async {
    state = StateModel(state: DataState.LOADING);
    ResponseModel responseModel = await _userRepository.logout();
    if (responseModel.isSuccess == true) {
      prefs.remove("User");
      ref.read(userProvider.notifier).updateUserData(null);
      state = StateModel(state: DataState.SUCCESS, data: true, message: responseModel.message);
    } else {
      state = StateModel(state: DataState.ERROR, message: responseModel.getFullError());
    }
  }

}

class UserFCMUseCase extends StateNotifier<StateModel<bool>> {
  final Ref ref;
  final UserRepository _userRepository;
  UserFCMUseCase(this.ref, this._userRepository) : super(StateModel());

  void setUserFCM(String fcm) async {
    state = StateModel(state: DataState.LOADING);
    ResponseModel responseModel = await _userRepository.setFCM(fcm);
    if (responseModel.isSuccess == true) {
      state = StateModel(
          state: DataState.SUCCESS, data: true, message: responseModel.message);
    } else {
      state =
          StateModel(state: DataState.ERROR, message: responseModel.message);
    }
  }
}

class DeleteAccountUseCase extends StateNotifier<StateModel<bool>> {
  final Ref ref;
  final UserRepository _userRepository;
  DeleteAccountUseCase(this.ref, this._userRepository) : super(StateModel());

  void delete() async {
    state = StateModel(state: DataState.LOADING);
    ResponseModel responseModel = await _userRepository.deleteAccount();
    if (responseModel.isSuccess == true) {
      state = StateModel(
          state: DataState.SUCCESS, data: true, message: responseModel.message);
    } else {
      state =
          StateModel(state: DataState.ERROR, message: responseModel.message);
    }
  }
}

class TNCUseCase extends StateNotifier<StateModel<String>> {
  final Ref ref;
  final UserRepository _userRepository;
  TNCUseCase(this.ref, this._userRepository) : super(StateModel());

  void get() async {
    state = StateModel(state: DataState.LOADING);
    ResponseModel responseModel = await _userRepository.getTNC();
    if (responseModel.isSuccess == true) {
      state = StateModel(
          state: DataState.SUCCESS, data: responseModel.data, message: responseModel.message);
    } else {
      state =
          StateModel(state: DataState.ERROR, message: responseModel.message);
    }
  }
}

class BottomNavState extends StateNotifier<bool> {
  final Ref ref;
  BottomNavState(this.ref) : super(true);

  void setVisible(bool isVisible) async {
    state = isVisible;
  }

  void toggle() async {
    state = !state;
  }
}
