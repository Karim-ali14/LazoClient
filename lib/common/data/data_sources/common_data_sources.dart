import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../Constants.dart';
import '../../../Data/Models/AddressModel.dart';
import '../../../Data/Models/ResponseModel.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/http_operation.dart';

typedef FutureResponseModel = Future<ResponseModel>;

class CommonRemoteDataSource {
  final HttpOperations _httpOps;

  CommonRemoteDataSource(this._httpOps);


  Future<List<dynamic>> fetchSuggestions(String input) async {
    final url = "$mainMapUrl$placesAutocompleteEndPoint?input=$input&key=$googleApiKey&components=country:eg";
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);

    if (json['status'] == 'OK') {
      return json['predictions'];
    } else {
      throw Exception(json['status']);
    }
  }

  Future<Address?> fetchPlaceDetails(String placeId) async {
    final url = "$mainMapUrl$placesDetailsEndPoint?place_id=$placeId&key=$googleApiKey";
    final response = await http.get(Uri.parse(url));
    final json = jsonDecode(response.body);

    if (json['status'] == 'OK') {
      final location = json['result']['geometry']['location'];
      final lat = location['lat'];
      final lng = location['lng'];
      final description = location['formatted_address'] ?? location['name'] ?? '';

      return Address(
        placeName: location['name'] ?? '',
        latitude: lat,
        longitude: lng,
        description: description,
      );
    } else {
      throw Exception(json['status']);
    }
  }

  Future<Address?> getAddressFromLatLng(double lat, double lng) async {
    final url = Uri.parse(
      "https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$googleApiKey",
    );

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data['status'] == 'OK' && data['results'].isNotEmpty) {
          String formattedAddress = data['results'][0]['formatted_address'];
          print("Google Address: $formattedAddress");
          return Address(placeName: formattedAddress, latitude: lat, longitude: lng, description: formattedAddress);
        } else {
          print("No results found");
          return null;
        }
      } else {
        print("Failed to fetch address. Status code: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }

}
