import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/currentLocation/domain/entities/currentLocationEntity.dart';

import '../../../../core/resources/services/geolocator.dart';
import 'DaoInt/DaoIntCurrentLoc.dart';
@Injectable(as:DaoIntCurrentLoc)
class DaoCurrentLocImp extends DaoIntCurrentLoc {

   GeolocatorService geolocatorService;
   @factoryMethod
  DaoCurrentLocImp(this.geolocatorService);
  @override
  Future<CurrentLocationEntity> getCurrentLocation()async {
    return geolocatorService.getCurrentPosition();

    throw UnimplementedError();
  }

  @override
  Future<void> insertCurrentLocation(double lat, double long) {
    // TODO: implement insertCurrentLocation
    throw UnimplementedError();
  }

  Future<bool> openLocationSettings(){
    return geolocatorService.openLocationSettings();
  }
  // Implementation of the data access object for current location
  // This class would typically include methods to interact with a database or API
  // to retrieve and store current location data.

}

