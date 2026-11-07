abstract class Failure {
  final String message;

  Failure(this.message);
}

class LocationServiceDisabledFailure extends Failure {
  LocationServiceDisabledFailure()
      : super('Location service is disabled');
}

class LocationPermissionDeniedFailure extends Failure {
   LocationPermissionDeniedFailure()
      : super('Location permission denied');
}

class LocationPermissionDeniedForeverFailure extends Failure {
   LocationPermissionDeniedForeverFailure()
      : super('Location permission denied forever');
}

class GetCurrentLocationFailure extends Failure {
   GetCurrentLocationFailure()
      : super('Failed to get current location');
}