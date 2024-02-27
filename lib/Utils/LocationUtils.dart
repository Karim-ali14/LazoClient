// import 'package:location/location.dart';
//
// class LocationUtils {
//
//   static Location location = Location();
//   static late bool _serviceEnabled;
//   static late PermissionStatus _permissionGranted;
//   static late LocationData locationData;
//
//   static Future<void> checkLocationPermission() async {
//     _serviceEnabled = await location.serviceEnabled();
//     if (!_serviceEnabled) {
//       _serviceEnabled = await location.requestService();
//       if (!_serviceEnabled) {
//         return;
//       }
//     }
//
//     _permissionGranted = await location.hasPermission();
//     if (_permissionGranted == PermissionStatus.denied) {
//       _permissionGranted = await location.requestPermission();
//       if (_permissionGranted != PermissionStatus.granted) {
//         return;
//       }
//     }
//
//     await getLocation();
//   }
//
//   static Future<LocationData?> getLocation() async {
//     try {
//       locationData = await location.getLocation();
//       return locationData;
//     } catch (e) {
//       print("Error getting location: $e");
//     }
//     return null;
//   }
// }