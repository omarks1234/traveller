import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:traveller/models/monument.dart';

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
  List<Monument>? favoriteMonuments;

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
    this.favoriteMonuments
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
      "favoriteMonuments": favoriteMonuments
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
    favoriteMonuments = (data?["favoriteMonuments"]as List<dynamic>)
        .map((e) => Monument.fromJson(e))
        .toList();
  }
}