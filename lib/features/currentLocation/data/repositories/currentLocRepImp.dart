import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/currentLocation/data/data_sources/DaoInt/DaoIntCurrentLoc.dart';
import 'package:traveller/features/currentLocation/data/exceptions/locationExceptions.dart';
import 'package:traveller/features/currentLocation/domain/entities/currentLocationEntity.dart';
import 'package:traveller/features/currentLocation/domain/failures/locationFailure.dart';
import 'package:traveller/features/currentLocation/domain/repositories/currentLocationRepo.dart';
@Injectable(as:CurrentLocationRepo)
class CurrentLocRepImp extends CurrentLocationRepo {
  DaoIntCurrentLoc daoIntCurrentLoc ;
  @factoryMethod
  CurrentLocRepImp(this.daoIntCurrentLoc);
  @override
  Future<Either<Failure ,CurrentLocationEntity >> getCurrentLocation()async {
    try{
      CurrentLocationEntity location  =  await daoIntCurrentLoc.getCurrentLocation();
      return Right(location);
    } on LocationServiceDisabledExcept {
      return Left(LocationServiceDisabledFailure());
    } on LocationPermissionDeniedException {
      return Left(LocationPermissionDeniedFailure());
    } on LocationPermissionDeniedForeverException {
      return Left(LocationPermissionDeniedForeverFailure());
    } catch (e) {
      return Left(GetCurrentLocationFailure());
    }
    catch(e){
      throw Exception('Failed to get current location from repository: $e');
    }
    // TODO: implement getCurrentLocation
    throw UnimplementedError();
  }

  @override
  Future<bool> openLocationSettings() {
   return daoIntCurrentLoc.openLocationSettings();
  }
  // Implementation of the Current Location Repository
}