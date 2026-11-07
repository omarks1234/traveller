import 'package:traveller/features/currentLocation/domain/entities/currentLocationEntity.dart';

abstract class DaoIntCurrentLoc {
  Future<void> insertCurrentLocation(double lat, double long);
  Future<CurrentLocationEntity> getCurrentLocation();
  Future<bool> openLocationSettings();
}