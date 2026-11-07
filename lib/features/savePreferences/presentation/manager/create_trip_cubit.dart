import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:traveller/features/savePreferences/domain/use_cases/createTripUsecase.dart';

part 'create_trip_state.dart';
@injectable
class CreateTripCubit extends Cubit<CreateTripState> {
  CreateTripUseCase createTripUseCase ;
  @factoryMethod
  CreateTripCubit(this.createTripUseCase) : super(CreateTripInitial());

  Future<void> createTrip (Map<String,dynamic>preferences)async{
    emit(CreateTripLoadingState());
    try{
      final response = await createTripUseCase.call(preferences);
      emit(CreateTripSuccessState(response));
    }catch(e){
        emit(CreateTripErrorState("Error creating trip"));

    }



  }
}
