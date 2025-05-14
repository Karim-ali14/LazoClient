
import '../../../Data/Models/AddressModel.dart';

abstract class CommonRepository{

  Future<List<dynamic>> getSuggestions(String input);

  Future<Address?> getLatLngFromPlaceId(String placeId);

  Future<Address?> getAddressFromLatLng(double lat, double lng);

}