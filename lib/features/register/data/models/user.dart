class User {
  String? name ;
  int? age ;
  String? gender ;
  String? birthDate ;
  String? email ;
  String? password ;
  String? rePassword ;
  User ({
    required this.name ,
    required this.age ,
    required this.gender ,
    required this.birthDate ,
    required this.email,
    required this.password ,
    required this.rePassword
       });
  Map<String , dynamic> userToJson (){
    return {
      "name" : name ,
      "age":age ,
      "gender" : gender,
      "birthDate" : birthDate,
      "password" : password,
      "rePassword" : rePassword
    };
  }

  User.fromJson(Map<String , dynamic>? data)
  {
    name = data?["name"] ;
    age = data?["age"];
    gender = data?["gender"];
    birthDate = data?["birthDate"] ;
    password = data?["password"] ;
    rePassword = data?["rePassword"] ;
  }

}