import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:traveller/features/savePreferences/data/models/userPreferenceModel.dart';

abstract class SavePreferenceDaoInt {
  Future<Either<void , String >> savePreference(Map<String , dynamic> preferences);
  Future<Either<void , String >> chooseExperience(Map<String , dynamic> trip , String tripId);
  Future< String > createTripCollection(Map<String , dynamic> preferences);


}