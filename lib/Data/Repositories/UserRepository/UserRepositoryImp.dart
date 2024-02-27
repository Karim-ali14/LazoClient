import '../../../../../Data/HttpOps.dart';
import '../../../../../Data/Models/ResponseModel.dart';
import 'package:http/http.dart' as http;
import '../../../ApiRouts.dart';
import 'UserRepository.dart';

class UserRepositoryImp implements UserRepository {
  final HttpOps _httpOps;
  UserRepositoryImp(this._httpOps);


  @override
  Future<ResponseModel> requestOrganization(Map<String,String> data,List<http.MultipartFile>files) async {

    return await _httpOps.postFormData(endPoint: "userOrganizationRequestEndPoint" , data: data,files: files,authorized: true);
  }

  @override
  Future<ResponseModel> requestPlaygroundMaking(Map<String,String> data,List<http.MultipartFile>files) async {
    return await _httpOps.postFormData(endPoint: "userPlaygroundRequestEndPoint" , data: data,files: files,authorized: true);
  }

  @override
  Future<ResponseModel> requestTeamMaking(Map<String,String> data,List<http.MultipartFile>files) async {
    return await _httpOps.postFormData(endPoint: "userTeamMakingRequestEndPoint" , data: data,files: files,authorized: true);
  }

  @override
  Future<ResponseModel> getUserInfo() async {
    return await _httpOps.getData(endPoint: userInfoEndPoint,authorized: true);
  }

  @override
  Future<ResponseModel> searchUsers(String key) async {
    return await _httpOps.postData(endPoint: "usersSearchEndPoint" , data: {"key" : key},authorized: true);

  }

  @override
  Future<ResponseModel> followOrg(int userId) async {
    return await _httpOps.postData(endPoint: "organizationFollowEndPoint" , params: "/$userId",authorized: true);
  }

  @override
  Future<ResponseModel> followTeam(int userId) async {
    return await _httpOps.postData(endPoint: "teamFollowEndPoint" , params: "/$userId",authorized: true);
  }

  @override
  Future<ResponseModel> followUsers(int userId) async {
    return await _httpOps.postData(endPoint: "usersFollowEndPoint", params: "/$userId",authorized: true);
  }

  @override
  Future<ResponseModel> setFCM(String token)  async {
    var data = {
      "token" : token
    };
    return await _httpOps.postData(endPoint: "setUserFCMEndPoint" , data : data ,authorized: true);
  }

  @override
  Future<ResponseModel> getAds() async {
    return await _httpOps.getData(endPoint: "getAdsEndPoint" ,authorized: true);
  }

  @override
  Future<ResponseModel> getTNC() async {
    return await _httpOps.getData(endPoint: "getTermsEndPoint" ,authorized: true);
  }

  @override
  Future<ResponseModel> deleteAccount() async {
    return await _httpOps.getData(endPoint: "deleteAccountEndPoint" ,authorized: true);
  }

  @override
  Future<ResponseModel> logout() async {
    return await _httpOps.getData(endPoint: "deleteAccountEndPoint" ,authorized: true);
  }

}