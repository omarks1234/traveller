import 'package:traveller/features/generatedTrip/data/models/tripDay.dart';

class GeneratedIternaryTrip {
  List<TripDay>? tripDays ;
  GeneratedIternaryTrip(this.tripDays);
  GeneratedIternaryTrip.fromJson(Map<String, dynamic> json){
    tripDays = json['days'].map<TripDay>((e) => TripDay.fromJson(e)).toList();
  }
}


