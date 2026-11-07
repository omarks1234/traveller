import 'package:injectable/injectable.dart';
import 'package:traveller/features/generatedTrip/domain/repositories/generatedTripRepoInt.dart';

import '../../../chooseExperience/data/models/trip.dart';
@injectable
class GetTripByIdUseCase {
  final GeneratedTripRepoInt repository;

  @factoryMethod
  GetTripByIdUseCase(this.repository);

  /// تنفيذ الـ UseCase لجلب رحلة معينة بواسطة الـ ID
  /// استخدام function باسم 'call' يسمح لك باستدعاء الـ class كأنها function
  Future<Trip> call(String uid, String tripId) async {
    return await repository.getTripById(uid, tripId);
  }
}