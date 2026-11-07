import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:traveller/features/generatedTrip/domain/use_cases/generatedTripUsecase.dart';
import 'package:traveller/features/generatedTrip/domain/use_cases/getTripByIdUseCase.dart';

import '../../../chooseExperience/data/models/trip.dart';

part 'generated_trip_state.dart';
@injectable
class GeneratedTripCubit extends Cubit<GeneratedTripState> {
  GeneratedTripUseCase generatedTripUseCase ;
  GetTripByIdUseCase getTripByIdUseCase ;
  @factoryMethod
  GeneratedTripCubit(this.generatedTripUseCase , this.getTripByIdUseCase) : super(GeneratedTripInitial());


  Future<void> generatedTrip (Trip trip)async{
    emit(GeneratedTripLoading());
    try{
      final response = await generatedTripUseCase.call(trip);
      emit(GeneratedTripSuccess(response));
    }catch(e){
      emit(GeneratedTripFailure(e.toString()));
    }











  }

  Future<Trip> getTripById (String uid , String tripId)async {
      final response = await getTripByIdUseCase.call(uid, tripId);
      return response;


    }
  }



