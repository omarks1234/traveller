part of 'create_trip_cubit.dart';

@immutable
sealed class CreateTripState {}

final class CreateTripInitial extends CreateTripState {}

final class CreateTripLoadingState extends  CreateTripState{}

final class  CreateTripSuccessState extends CreateTripState {
  String tripId;
  CreateTripSuccessState(this.tripId);
}
final class CreateTripErrorState extends CreateTripState {
  String errorMessage;
  CreateTripErrorState(this.errorMessage);
}

