
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:traveller/features/placeSearch/data/models/placeSearchResponseModel.dart';
part 'placesApiService.g.dart';
@RestApi(baseUrl:'https://places.googleapis.com/v1/')
abstract class PlacesApiService {
  factory PlacesApiService(Dio dio) = _PlacesApiService;
  @POST('places:searchText')
  Future<PlaceSearchResponseModel> searchPlaces(@Body() Map<String, dynamic> data);
}