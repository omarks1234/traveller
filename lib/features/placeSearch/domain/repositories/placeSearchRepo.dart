import 'package:dartz/dartz.dart';
import 'package:traveller/features/placeSearch/domain/entities/placeSearchEntity.dart';

abstract class PlaceSearchRepo {
  Future<Either<List<PlaceSearchEntity> , String>> searchPlaces(String query);
}