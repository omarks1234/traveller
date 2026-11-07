import 'package:dartz/dartz.dart';
import 'package:traveller/features/currentLocation/domain/entities/currentLocationEntity.dart';
import 'package:traveller/features/currentLocation/domain/failures/locationFailure.dart';

abstract class CurrentLocationRepo {
  Future<Either<Failure , CurrentLocationEntity >> getCurrentLocation();
  Future<bool> openLocationSettings();
}