import '../../../Data/Models/AddressModel.dart';
import '../../domain/repositories/common_repository.dart';
import '../data_sources/common_data_sources.dart';

class CommonRepositoryImp extends CommonRepository {
  final CommonRemoteDataSource _commonRemoteDataSource;

  CommonRepositoryImp(this._commonRemoteDataSource);


  @override
  Future<List<dynamic>> getSuggestions(String input) {
    return _commonRemoteDataSource.fetchSuggestions(input);
  }

  @override
  Future<Address?> getLatLngFromPlaceId(String placeId) {
    return _commonRemoteDataSource.fetchPlaceDetails(placeId);
  }

  @override
  Future<Address?> getAddressFromLatLng(double lat, double lng) {
    return _commonRemoteDataSource.getAddressFromLatLng(lat, lng);
  }
}
