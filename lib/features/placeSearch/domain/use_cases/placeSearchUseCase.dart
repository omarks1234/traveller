import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/placeSearch/domain/entities/placeSearchEntity.dart';

import '../repositories/placeSearchRepo.dart';
@injectable
class PlaceSearchUseCase {
  final PlaceSearchRepo repository;
@factoryMethod
  PlaceSearchUseCase(this.repository);

  Future<Either<List<PlaceSearchEntity> , String>> call (String query) async {
    return await repository.searchPlaces(query);
  }
}