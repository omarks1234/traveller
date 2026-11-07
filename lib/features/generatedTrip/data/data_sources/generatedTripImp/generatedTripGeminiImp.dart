import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/generatedTrip/data/data_sources/GeneratedTripDao.dart';
import 'package:traveller/features/generatedTrip/data/data_sources/aiTripService.dart';
import 'package:traveller/features/register/firebase_services.dart';

import '../../../../chooseExperience/data/models/trip.dart';

@Injectable(as: GeneratedTripDao)
class GeneratedTripGeminiImp extends GeneratedTripDao {
  FireBaseServices firebaseService ;
  SaveGeneratedItinerary saveGeneratedItinerary ;
  AiTripService aiTripService;
  @factoryMethod
  GeneratedTripGeminiImp(this.aiTripService , this.saveGeneratedItinerary , this.firebaseService);
  @override
  Future<Map<String,dynamic>> createGeneratedTrip(Trip trip) async{
     try{
       final generatedTrip = await aiTripService.generateItinerary(trip);
       final userId = FirebaseAuth.instance.currentUser?.uid;

       if (userId == null || trip.tripId == null) {
         throw Exception('User ID or Trip ID is missing');
       }

       await saveGeneratedItinerary.call(
         userId: userId,
         tripId: trip.tripId!,
         itinerary: generatedTrip,
       );
       return generatedTrip;
     }catch(e){
        rethrow ;
      }


    
  }

  @override
  Future<Trip> getTripById(String uid, String tripId) async{

   try{
     final response = await firebaseService.getTripById(uid, tripId);
     return response ;
   }catch(e){
     throw e  ;
   }
  }

}



@singleton
class SaveGeneratedItinerary {

 SaveGeneratedItinerary();
  Future<void> call({
    required String userId,
    required String tripId,
    required Map<String, dynamic> itinerary,
  }) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('trips')
        .doc(tripId)
        .update({
      'generatedItinerary': itinerary,
      'generatedAt': FieldValue.serverTimestamp(),
    });
  }
}
