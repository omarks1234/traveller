import 'package:traveller/features/placeSearch/data/models/placeModel.dart';

class PlaceSearchResponseModel {
  final List<PlaceModel> places;

  PlaceSearchResponseModel({required this.places});

  factory PlaceSearchResponseModel.fromJson(Map<String, dynamic> json) {
    var placesJson = json['places'] as List;
    List<PlaceModel> placesList =
        placesJson.map((place) => PlaceModel.fromJson(place)).toList();
    return PlaceSearchResponseModel(places: placesList);
  }
}