import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/savePreferences/data/models/userPreferenceModel.dart';
import 'package:traveller/features/savePreferences/domain/repositories/preferenceRepoInt.dart';
@injectable
class ChooseExperienceUseCase {
  final PreferenceRepoInt repository;
  @factoryMethod
  ChooseExperienceUseCase(this.repository);

  Future<Either<void , String>> call(Map<String,dynamic> trip , String tripId) async {
    final response = await repository.chooseExperience(trip , tripId);
    return response.fold(
          (l) => Left(null),
          (r) => Right(r),
    );
  }
}