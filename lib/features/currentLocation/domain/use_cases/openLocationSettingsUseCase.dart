import 'package:injectable/injectable.dart';
import 'package:traveller/features/currentLocation/domain/repositories/currentLocationRepo.dart';

@injectable
class Openlocationsettingsusecase {
  CurrentLocationRepo repo ;
  Openlocationsettingsusecase(this.repo);
  Future <bool> call () {
    return repo.openLocationSettings();
  }
}