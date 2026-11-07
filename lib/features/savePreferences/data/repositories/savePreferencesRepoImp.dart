import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/savePreferences/data/data_sources/SavePreferenceDaoInt.dart';
import 'package:traveller/features/savePreferences/data/models/userPreferenceModel.dart';
import 'package:traveller/features/savePreferences/domain/repositories/preferenceRepoInt.dart';
@Injectable(as:PreferenceRepoInt)
class SavePreferencesRepoImp extends PreferenceRepoInt {
  SavePreferenceDaoInt savePreferenceDao ;
  @factoryMethod
  SavePreferencesRepoImp(this.savePreferenceDao);
  @override
  Future<Either<void , String >> savePreferences(Map<String , dynamic> preferences) async{
   final response =  await savePreferenceDao.savePreference(preferences);
   return response.fold(
      (l) => Left(null),
      (r) => Right(r),
    );
  }

  @override
  Future<Either<void, String>> chooseExperience(Map<String, dynamic> preferences , String tripId) async{
    final response =  await savePreferenceDao.chooseExperience(preferences , tripId);
   return response.fold(
      (l) => Left(null),
      (r) => Right(r),
    );
  }

  @override
  Future<String> createTrip(Map<String , dynamic > preferences) async{
    final response =  await savePreferenceDao.createTripCollection(preferences);
   return response;
  }
}