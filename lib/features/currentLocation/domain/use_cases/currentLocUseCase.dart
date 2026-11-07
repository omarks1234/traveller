import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/currentLocation/domain/failures/locationFailure.dart';

import '../entities/currentLocationEntity.dart';
import '../repositories/currentLocationRepo.dart';
@injectable
class CurrentLocUseCase {
  @factoryMethod
  final CurrentLocationRepo repository;
  CurrentLocUseCase(this.repository);

  Future<Either<Failure , CurrentLocationEntity>> call() async {

    return repository.getCurrentLocation();
  }
}