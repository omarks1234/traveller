part of 'current_location_cubit.dart';


sealed class CurrentLocationState {}

final class CurrentLocationInitial extends CurrentLocationState {}
final class CurrentLocationLoading extends CurrentLocationState {}
final class CurrentLocationServiceDisabled extends CurrentLocationState {}


final class CurrentLocationSuccess extends CurrentLocationState {
  final CurrentLocationEntity currentLocationEntity ;
  final Set<Marker> markers;
  CurrentLocationSuccess(this.currentLocationEntity , this.markers);
}
final class CurrentLocationFailure extends CurrentLocationState{
  final String errorMessage;

  CurrentLocationFailure({required this.errorMessage});
}


