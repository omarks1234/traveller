import 'package:injectable/injectable.dart';

import '../../../chooseExperience/data/models/trip.dart';
import '../../domain/repositories/generatedTripRepoInt.dart';
import '../data_sources/GeneratedTripDao.dart';

@Injectable(as: GeneratedTripRepoInt)
class GeneratedTripRepoImp extends GeneratedTripRepoInt {
  final GeneratedTripDao generatedTripDao;
  @factoryMethod
  GeneratedTripRepoImp(this.generatedTripDao);

  @override
  Future<Map<String,dynamic>> generateTrip(Trip trip) async {
    try{
      final response = await generatedTripDao.createGeneratedTrip(trip);
      return response ;
    }catch(e){
      throw e;
    }
  }
  @override
  Future<Trip>getTripById(String uid , String tripId){
  try{
    final response =  generatedTripDao.getTripById(uid, tripId);
    return response ;
  }catch(e){
    print("error two ");
    throw e ;
  }
  }



}