
import 'package:flutter/material.dart';

class BirthDate {
  static Future<DateTime?> pickData (BuildContext context)async{
    DateTime? pickedData = await showDatePicker(
        context: context,
        initialDate: DateTime(2000),
        firstDate: DateTime(1940),
        lastDate: DateTime.now() ,
    );
    return pickedData ;
  }


}