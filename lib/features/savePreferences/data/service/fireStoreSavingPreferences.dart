import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/chooseExperience/data/models/trip.dart';
import 'package:traveller/features/savePreferences/data/models/userPreferenceModel.dart';

import '../../../register/firebase_services.dart';
@singleton
class FireStoreSavingPreferences {


  FireBaseServices firebaseService;
  @factoryMethod
  FireStoreSavingPreferences(this.firebaseService);

  @override
  Future<Either<void , String>> savePreference(Map<String, dynamic> preferences) async {
    try {
       await firebaseService.savepreferences(preferences);
       return Left(null);
    } catch (e) {
      return Right(e.toString());

      // Add your Firestore saving preferences implementation here
    }
  }
  Future<Either<void , String>> chooseExperince(Map<String , dynamic> trip , String tripId) async
  {
    try {
      await firebaseService.modifyTripCollection(FirebaseAuth.instance.currentUser!.uid, tripId ,trip);
      return Left(null);
    } catch (e) {
      return Right(e.toString());

      // Add your Firestore saving preferences implementation here
    }
  }

  Future< String> createTrip(Map<String,dynamic> preferences) async
  {
    try {
      final response = await firebaseService.createTripCollection(FirebaseAuth.instance.currentUser!.uid , preferences );
      return response;
    } catch (e) {
      return e.toString();

      // Add your Firestore saving preferences implementation here
    }
  }


}