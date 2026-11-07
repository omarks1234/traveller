import 'activity.dart';

class TripDay{
  List<Activity>? activities ;
  int? day ;
  String? title ;
  TripDay(this.day , this.title , this.activities);
  TripDay.fromJson(Map<String, dynamic> json){
    day = json['day'].toInt();
    title = json['title'];
    activities = json['activities'].map<Activity>((e) => Activity.fromJson(e)).toList();
  }
}