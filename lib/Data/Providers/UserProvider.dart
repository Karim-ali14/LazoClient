import 'dart:convert';
import '../../../../../Data/Models/StateModel.dart';
import '../../../../../Data/Repositories/UserRepository/UserRepository.dart';
import '../../../../../Data/Repositories/UserRepository/UserRepositoryImp.dart';
import '../../../../../ViewModels/UserViewModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../main.dart';
import '../HttpOps.dart';
import '../Models/User.dart';

class UserModelProvider extends StateNotifier<User?> {
  final Ref ref;

  UserModelProvider(this.ref) : super(null) {
    String? userJson = prefs.getString("User");
    if(userJson != null){
      Map<String,dynamic> userJsonObj = json.decode(userJson);
      state = User.fromJson(userJsonObj);
    }
  }

  void updateUserData(User? userModel){
    state = userModel;
  }
}

final userProvider = StateNotifierProvider<UserModelProvider,User?>((ref)  {
  return UserModelProvider(ref);
});


final httpServiceProvider = Provider<HttpOps>((ref)  {
  return HttpOps(ref.watch(userProvider),ref);
});

final userRepoProvider = Provider<UserRepository>((ref)  {
  return UserRepositoryImp(ref.watch(httpServiceProvider));
});

final userLogoutNotifier = StateNotifierProvider<UserLogOutUseCase,StateModel<bool>>((ref)  {
  return UserLogOutUseCase(ref,ref.watch(userRepoProvider));
});

final userFCMNotifier = StateNotifierProvider<UserFCMUseCase,StateModel<bool>>((ref)  {
  return UserFCMUseCase(ref,ref.watch(userRepoProvider));
});

final deleteAccountNotifier = StateNotifierProvider<DeleteAccountUseCase,StateModel<bool>>((ref)  {
  return DeleteAccountUseCase(ref,ref.watch(userRepoProvider));
});

final termsNotifier = StateNotifierProvider<TNCUseCase,StateModel<String>>((ref)  {
  return TNCUseCase(ref,ref.watch(userRepoProvider));
});

final bottomNavVisibilityNotifier = StateNotifierProvider<BottomNavState,bool>((ref)  {
return BottomNavState(ref);
});