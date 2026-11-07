import 'package:injectable/injectable.dart';
import 'package:traveller/features/generatedTrip/domain/repositories/generatedTripRepoInt.dart';

import '../../../chooseExperience/data/models/trip.dart';
@injectable
class GeneratedTripUseCase {
  GeneratedTripRepoInt repository;
  @factoryMethod
 GeneratedTripUseCase(this.repository);

  Future<Map<String,dynamic>> call (Trip trip ) async {
    return await repository.generateTrip(trip);
  }
}