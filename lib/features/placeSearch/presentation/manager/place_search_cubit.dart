import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/placeSearchEntity.dart';
import '../../domain/use_cases/placeSearchUseCase.dart';

part 'place_search_state.dart';
@injectable
class PlaceSearchCubit extends Cubit<PlaceSearchState> {
  final PlaceSearchUseCase placeSearchUseCase;
  @factoryMethod
  PlaceSearchCubit(this.placeSearchUseCase) : super(PlaceSearchInitial());

  Future<void> searchPlaces(String query) async {
    emit(PlaceSearchLoading());
    final result = await placeSearchUseCase(query);
    result.fold(
      (places) => emit(PlaceSearchSuccess(places)),
      (errorMessage) => emit(PlaceSearchError(errorMessage)),
    );
  }
  void clearSearchResults() {
    emit(PlaceSearchInitial());
  }
}
