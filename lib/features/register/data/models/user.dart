import 'package:cloud_firestore/cloud_firestore.dart';

class TravellerUser {
  String? name ;
  String? age ;
  String? gender ;
  String? birthDate ;
  String? email ;
  String? password ;
  String? rePassword ;
  String? userId ;
  String? userType;
  TravellerUser ({
    this.name ,
    this.age ,
    this.gender ,
    this.birthDate ,
    this.email,
    this.password ,
    this.rePassword,
    this.userId,
    this.userType
       });
  Map<String , dynamic> toJson ( ){

    return {
      "name" : name ,
      "age":age ,
      "gender" : gender,
      "birthDate" : birthDate,
      "password" : password,
      "rePassword" : rePassword,
      "id" : userId,
      "userType":userType,
    };
  }

  TravellerUser.fromJson(DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions? options)
  {
    final data = snapshot.data();
    name = data?["name"] ;
    age = data?["age"];
    gender = data?["gender"];
    birthDate = data?["birthDate"] ;
    password = data?["password"] ;
    rePassword = data?["rePassword"] ;
    userId = data?["id"] ;
    userType = data?["userType"];
  }

}