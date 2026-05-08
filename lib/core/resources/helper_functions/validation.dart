import 'package:traveller/core/resources/strings_manager.dart';

class Validation {
  static String? nameValidator (String? name){  //String? Function(String?)?
     if (name?.isEmpty??true){
       return "This field must be filled";
     }
     if (name!.length>20){
       return "The letters must be less than 20 letters";
     }
  }
  static String? ageValidator (String? age){
    if (age?.isEmpty??true){
      return "This field must be filled";
    }
    int number = int.parse(age!);
    if (number<=0 || number > 100 ){
      return "age should be between 0 and 100 " ;
    }
    return null ;
  }
  static String? birthValidator (String? birthDate){
    if (birthDate?.isEmpty??true){
      return "Enter your birth date ";
    }
  }

  static String? genderValidator (String? gender){
    if (gender?.isEmpty??true){
      return "Enter your gender ";
    }
  }

  static String? emailValidator (String? email){

    if (!RegExp(Constants.regex).hasMatch(email!)){
      return "Your email is wrong" ;
    }
  }

  static String? passValidator (String? pass){
    if (pass!.length<6){
      return "Pass must be more than 6 letter";
    }
    else if (!RegExp(Constants.regexCapital).hasMatch(pass)){
      return "Pass should contains at least one capital letter";
    }
    else if (!RegExp(Constants.regexSymbol).hasMatch(pass)){
      return "Pass should contain at least one symbol";
    }
  }


}