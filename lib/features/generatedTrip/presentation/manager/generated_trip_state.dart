part of 'generated_trip_cubit.dart';

@immutable
sealed class GeneratedTripState {}

final class GeneratedTripInitial extends GeneratedTripState {}

final class GeneratedTripLoading extends GeneratedTripState {}

final class GeneratedTripSuccess extends GeneratedTripState{
  Map<String,dynamic> generatedItenerary ;
  GeneratedTripSuccess(this.generatedItenerary);
}

final class GeneratedTripFailure extends GeneratedTripState{
  String err ;
  GeneratedTripFailure(this.err);
}

















