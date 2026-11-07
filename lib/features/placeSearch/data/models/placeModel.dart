import 'package:traveller/features/placeSearch/domain/entities/placeSearchEntity.dart';

class PlaceModel {
   String? name;
   String? address;
   double? latitude;
   double? longitude;

  PlaceModel({
     this.name,
     this.address,
     this.latitude,
     this.longitude,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      name: json['displayName']['text'],
      address: json['formattedAddress'],
      latitude: json['location']['latitude'],
      longitude: json['location']['longitude'],
    );
  }

  PlaceSearchEntity modelToEntity() {
    return PlaceSearchEntity(
      name: name,
      address: address,
      latitude: latitude,
      longitude: longitude,

    );
  }
}