import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveller/features/chooseExperience/data/models/attraction.dart';


import '../../../chooseExperience/data/models/trip.dart';
import '../../../savePreferences/data/models/userPreferenceModel.dart';

class TravellerUser {
  String? name;

  String? age;

  String? gender;

  String? birthDate;

  String? email;

  String? password;

  String? rePassword;

  String? userId;

  String? userType;


  UserPreferenceModel ? userPreferenceModel;

  Trip ? trip;

  TravellerUser({
    this.name,
    this.age,
    this.gender,
    this.birthDate,
    this.email,
    this.password,
    this.rePassword,
    this.userId,
    this.userType,
    this.trip,
    this.userPreferenceModel
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "age": age,
      "gender": gender,
      "birthDate": birthDate,
      "password": password,
      "rePassword": rePassword,
      "id": userId,
      "userType": userType,
      "trip": trip != null ? {
        "attractivePlaces": trip!.attractivePlaces?.map((e) => e).toList(),
        "foods": trip!.foods?.map((e) => e).toList(),
        "transportation": trip!.transportation?.map((e) => e).toList(),
      } : null,
      "userPreferenceModel": userPreferenceModel?.userPreferenceToJson(),
    };
  }

  TravellerUser.fromJson(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options)
  {
    final data = snapshot.data();
    name = data?["name"];
    age = data?["age"];
    gender = data?["gender"];
    birthDate = data?["birthDate"];
    password = data?["password"];
    rePassword = data?["rePassword"];
    userId = data?["id"];
    userType = data?["userType"];
    trip = data?["trip"] != null ? Trip.fromJson(data?["trip"] ) : null;
    userPreferenceModel = data?["userPreferenceModel"] != null
        ? UserPreferenceModel.fromJson(data?["userPreferenceModel"])
        : null;
  }
}