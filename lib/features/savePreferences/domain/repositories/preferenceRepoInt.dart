import 'package:dartz/dartz.dart';
import 'package:traveller/features/savePreferences/data/models/userPreferenceModel.dart';

abstract class PreferenceRepoInt {
  Future<Either<void , String >> savePreferences(Map<String , dynamic> preferences);
  Future<Either<void , String >> chooseExperience(Map<String , dynamic> preferences , String tripId);
  Future<String> createTrip(Map<String,dynamic> preferences);
}
