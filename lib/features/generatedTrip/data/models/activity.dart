class Activity{
  String? category ;
  String? description ;
  String? placeName ;
  String? time ;
  Activity(this.category , this.description , this.placeName , this.time);
  Activity.fromJson(Map<String, dynamic> json){
    category = json['category'];
    description = json['description'];
    placeName = json['placeName'];
    time = json['time'];

  }
}