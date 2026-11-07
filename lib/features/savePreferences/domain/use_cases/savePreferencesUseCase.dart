import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/savePreferences/data/models/userPreferenceModel.dart';
import 'package:traveller/features/savePreferences/domain/repositories/preferenceRepoInt.dart';
@injectable
class SavePreferencesUseCase {
  final PreferenceRepoInt repository;
@factoryMethod
  SavePreferencesUseCase(this.repository);

  Future<Either<void , String>> call(Map<String,dynamic> preferences) async {
    final response = await repository.savePreferences(preferences);
    return response.fold(
      (l) => Left(null),
      (r) => Right(r),
    );
  }
}