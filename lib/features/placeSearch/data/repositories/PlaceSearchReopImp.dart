import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/placeSearch/data/data_sources/placeSearchDaoInt.dart';
import 'package:traveller/features/placeSearch/domain/entities/placeSearchEntity.dart';
import 'package:traveller/features/placeSearch/domain/repositories/placeSearchRepo.dart';
@Injectable(as: PlaceSearchRepo)
class PlaceSearchRepoImp extends PlaceSearchRepo  {
  PlaceSearchDaoInt placeSearchDaoInt;
  @factoryMethod
  PlaceSearchRepoImp(this.placeSearchDaoInt);
  @override
  Future<Either<List<PlaceSearchEntity>, String>> searchPlaces(String query) async{
  try{
    final response = await placeSearchDaoInt.searchPlace(query);
    return Left(response.places.map((place)=> place.modelToEntity()).toList());
  }catch(e)
  {
    return Right(e.toString());
  }
  }

  // Implement the methods for place search repository
}