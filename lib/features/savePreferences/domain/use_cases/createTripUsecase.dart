import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/savePreferences/data/models/userPreferenceModel.dart';
import 'package:traveller/features/savePreferences/domain/repositories/preferenceRepoInt.dart';
@injectable
class CreateTripUseCase {
  final PreferenceRepoInt repository;
  @factoryMethod
  CreateTripUseCase(this.repository);

  Future< String> call(Map<String , dynamic> preferences) async {
    final response = await repository.createTrip(preferences);
    return response ;

  }
}