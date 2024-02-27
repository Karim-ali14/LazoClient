import '../../../../../Data/Models/ResponseModel.dart';
import 'package:http/http.dart' as http;

mixin UserRepository {

  Future<ResponseModel> logout();

  Future<ResponseModel> getUserInfo();

  Future<ResponseModel> getAds();

  Future<ResponseModel> setFCM(String token);

  Future<ResponseModel> requestOrganization(Map<String,String> data,List<http.MultipartFile>files);

  Future<ResponseModel> requestTeamMaking(Map<String,String> data,List<http.MultipartFile>files);

  Future<ResponseModel> requestPlaygroundMaking(Map<String,String> data,List<http.MultipartFile>files);

  Future<ResponseModel> searchUsers(String key);

  Future<ResponseModel> followUsers(int userId);

  Future<ResponseModel> followTeam(int userId);

  Future<ResponseModel> followOrg(int userId);

  Future<ResponseModel> getTNC();

  Future<ResponseModel> deleteAccount();
}