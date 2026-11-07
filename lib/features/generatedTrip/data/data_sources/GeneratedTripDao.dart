import 'package:dartz/dartz.dart';

import '../../../chooseExperience/data/models/trip.dart';

abstract class GeneratedTripDao {
  Future<Map<String,dynamic>> createGeneratedTrip(Trip trip);
  Future<Trip> getTripById(String uid ,String tripId);

}