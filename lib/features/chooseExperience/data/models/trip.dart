

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveller/features/chooseExperience/data/models/transportation.dart';
import 'package:traveller/features/savePreferences/data/models/userPreferenceModel.dart';
import 'attraction.dart';
import 'food.dart';

class Trip {
  String? tripId;
  List<String>? attractivePlaces;
  List<String>? foods;
  List<String>? transportation;
  UserPreferenceModel? userPreferenceModel;

  Trip({
    this.tripId,
    this.userPreferenceModel,
    this.attractivePlaces,
    this.foods,
    this.transportation,
  });

  Trip.fromJson(Map<String, dynamic> data) {

    tripId = data["tripId"];
    if (data['userPreferenceModel'] != null) {
      userPreferenceModel = UserPreferenceModel.fromJson(data['userPreferenceModel']);
    }
    if (data["attractivePlaces"] != null) {
      attractivePlaces = <String>[];
      data["attractivePlaces"].forEach((place) {
        attractivePlaces!.add(place.toString());
      });
    }
    if (data['food'] != null) {
      foods = <String>[];
      data['food'].forEach((food) {
        foods!.add(food.toString());
      });
    }
    if (data['transportation'] != null) {
      transportation = <String>[];
      data['transportation'].forEach((mean) {
        transportation!.add(mean.toString());
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["tripId"] = tripId;
    if (attractivePlaces != null) {
      data["attractivePlaces"] =
          attractivePlaces!.map((v) => v).toList();
    }
    if (foods != null) {
      data['food'] = foods!.map((v) => v).toList();
    }
    if (transportation != null) {
      data['transportation'] = transportation!.map((v) => v).toList();
    }
    if (userPreferenceModel != null) {
      data['userPreferenceModel'] = userPreferenceModel!.userPreferenceToJson();
    }
    return data;
  }

}
