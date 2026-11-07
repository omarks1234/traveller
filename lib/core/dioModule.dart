import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../features/placeSearch/data/remote/placesApiService.dart';
@module
 abstract class DioModule {
  @singleton
  Dio getDio() {
    final dio = Dio();
    dio.options.baseUrl = 'https://places.googleapis.com/v1/';
    dio.options.connectTimeout = const Duration(seconds: 10);
    dio.options.receiveTimeout = const Duration(seconds: 10);
    dio.options.headers = {
      'Content-Type': 'application/json',
      'X-Goog-Api-Key':'AIzaSyD67fx0s9O0ik9WNsV_LWSYeVAXuVDQigk',
      'X-Goog-FieldMask':'places.displayName,places.formattedAddress,places.location,places.rating'
    };
    return dio;
  }

  @singleton
  PlacesApiService getPlacesApiService(Dio dio) {
    return PlacesApiService(dio);
  }



}