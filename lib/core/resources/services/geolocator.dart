 import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/currentLocation/data/exceptions/locationExceptions.dart' ;
import 'package:traveller/features/currentLocation/domain/entities/currentLocationEntity.dart';
@singleton
class GeolocatorService {
  Future<CurrentLocationEntity> getCurrentPosition() async {
    // Implementation to get the current position using geolocator package
    try{
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw LocationServiceDisabledExcept();
      }
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }
      if (permission == LocationPermission.denied) {
        throw LocationPermissionDeniedException();
      }
      if (permission == LocationPermission.deniedForever) {
        throw LocationPermissionDeniedForeverException();
      }
      Position position = await Geolocator.getCurrentPosition();
      return CurrentLocationEntity(
        latitude: position.latitude,
        longitude: position.longitude,
      );
    }on LocationServiceDisabledExcept {
      rethrow ;
    } on LocationPermissionDeniedException {
      rethrow;
    } on LocationPermissionDeniedForeverException {
      rethrow;
    } catch (e) {
      throw GetCurrentLocationException();
    }

    catch(e){
      throw Exception('Failed to get current position: $e');
    }

  }
  Future<bool> openLocationSettings()async{
    return await Geolocator.openLocationSettings();
  }

  /*Future<List<Placemark>> getPlacemarksFromCoordinates(double latitude, double longitude) async {
    // Implementation to get placemarks from coordinates using geolocator package
  }*/

  /*Future<double> distanceBetween(double startLatitude, double startLongitude,
      double endLatitude, double endLongitude) async {
    // Implementation to calculate distance between two coordinates using geolocator package
  }*/
}