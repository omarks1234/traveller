import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/register/firebase_services.dart';
import 'package:traveller/features/savePreferences/data/data_sources/SavePreferenceDaoInt.dart';
import 'package:traveller/features/savePreferences/data/models/userPreferenceModel.dart';
import 'package:traveller/features/savePreferences/data/service/fireStoreSavingPreferences.dart';
@Injectable(as:SavePreferenceDaoInt)
class SavePreferenceFirestoreImp extends SavePreferenceDaoInt  {
  FireStoreSavingPreferences fireStoreSavingPreferences ;
  @factoryMethod
  SavePreferenceFirestoreImp(this.fireStoreSavingPreferences);
  @override
  Future<Either<void , String >> savePreference(Map<String , dynamic > preferences)async {

    final response = await fireStoreSavingPreferences.savePreference(preferences);
    return response.fold(
      (l) => Left(null),
      (r) => Right(r),
    );

  }

  @override
  Future<Either<void, String>> chooseExperience(Map<String, dynamic> trip , String tripId)async {
    final response = await fireStoreSavingPreferences.chooseExperince(trip , tripId );
    return response.fold(
      (l) => Left(null),
      (r) => Right(r),
    );
  }

  @override
  Future<String> createTripCollection(Map<String ,dynamic>preferences) async{
    try{
      final response = await fireStoreSavingPreferences.createTrip(preferences);
      return response ;
    }catch(e){
      return e.toString();
    }


  }
  }



  // Implementation details for saving preferences to Firestore
