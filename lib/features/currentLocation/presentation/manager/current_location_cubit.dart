import 'package:bloc/bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:traveller/features/currentLocation/domain/entities/currentLocationEntity.dart';
import 'package:traveller/features/currentLocation/domain/use_cases/openLocationSettingsUseCase.dart';
import '../../domain/failures/locationFailure.dart';
import '../../domain/use_cases/currentLocUseCase.dart';
part 'current_location_state.dart';
@injectable
class CurrentLocationCubit extends Cubit<CurrentLocationState> {
  CurrentLocUseCase currentLocationUseCase;
  Openlocationsettingsusecase openlocationsettingsusecase ;
  @factoryMethod
  CurrentLocationCubit(this.currentLocationUseCase , this.openlocationsettingsusecase) : super(CurrentLocationInitial());

  void addMarker (LatLng position){
    if (state is CurrentLocationSuccess){
      final currentState = state as CurrentLocationSuccess;
      final updatedMarkers = Set<Marker>.from(currentState.markers);
      updatedMarkers.add(
          Marker(
              markerId: MarkerId( "${position.latitude}_${position.longitude}"),
              position: position,
              infoWindow: InfoWindow(title: "Marker at ${position.latitude}, ${position.longitude}")
          ) ) ;
      emit(CurrentLocationSuccess(currentState.currentLocationEntity, updatedMarkers));
    }
  }
  void deleteMarker (MarkerId markerId ) {

  
    if (state is CurrentLocationSuccess){
      final currentState = state as CurrentLocationSuccess;
      final updatedMarkers = Set<Marker>.from(currentState.markers);
       updatedMarkers.removeWhere((marker) => marker.markerId.value == markerId.value ,);
       emit(CurrentLocationSuccess(
         currentState.currentLocationEntity,
         updatedMarkers
       ));
    }
  }
  Future<void> getCurrentLocation() async {



    emit(CurrentLocationLoading());
      final result = await currentLocationUseCase.call();
      result.fold(
        (failure){
          if (failure is LocationServiceDisabledFailure){
            emit(CurrentLocationServiceDisabled());
          }
          else {
            emit(CurrentLocationFailure(errorMessage: failure.message));
          }
        },
        (location) {
          final marker =  Marker(
            markerId: MarkerId('current_location'),
            position: LatLng(location.latitude, location.longitude),
            infoWindow: InfoWindow(title: 'My Location'),
          );
          emit(CurrentLocationSuccess(location , {marker}));
        }
      );

  }


  Future<void> openLocationSettings() async{

     await openlocationsettingsusecase.call();

  }
}
