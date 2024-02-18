import 'package:geolocator/geolocator.dart';



class LocationService {
  Future<Position?> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return null;
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      return position;
    } catch (e) {
      print('Error getting location: $e');
      return null;
    }
  }
}






