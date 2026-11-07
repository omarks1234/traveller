import 'package:traveller/features/placeSearch/data/models/placeSearchResponseModel.dart';

abstract class PlaceSearchDaoInt {
  Future<PlaceSearchResponseModel> searchPlace(String query);

}