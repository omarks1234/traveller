import 'package:traveller/features/chooseExperience/data/models/trip.dart';

abstract class GeneratedTripRepoInt {
  Future<Map<String,dynamic>> generateTrip(Trip trip);
  Future<Trip> getTripById (String uid , String tripId);
}