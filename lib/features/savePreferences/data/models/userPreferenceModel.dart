import '../../../chooseExperience/data/models/trip.dart';

class UserPreferenceModel {
  String? destination;
  int? numberOfDays;
  String? budget;
  List<String>? interests ;
  String? tripStyle;

  UserPreferenceModel({
    this.destination,
    this.numberOfDays,
    this.budget,
    this.interests,
    this.tripStyle
  });
  
  Map<String , dynamic> userPreferenceToJson() {
    return {
      "destination": destination,
      "numberOfDays": numberOfDays,
      "budget": budget,
      "interests": interests,
      "tripStyle": tripStyle
    };
  }

  UserPreferenceModel.fromJson(Map<String,dynamic>? data){
    destination = data?["destination"];
    numberOfDays = data?["numberOfDays"];
    budget = data?["budget"];
    interests = List<String>.from(data?["interests"] ?? []);
    tripStyle = data?["tripStyle"];
  }

}