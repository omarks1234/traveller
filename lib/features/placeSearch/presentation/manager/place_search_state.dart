part of 'place_search_cubit.dart';

@immutable
sealed class PlaceSearchState {}

final class PlaceSearchInitial extends PlaceSearchState {}

final class PlaceSearchLoading extends PlaceSearchState {}

final  class PlaceSearchSuccess extends PlaceSearchState {
  final List<PlaceSearchEntity> places;

  PlaceSearchSuccess(this.places);
}

final class PlaceSearchError extends PlaceSearchState {
  final String errorMessage;

  PlaceSearchError(this.errorMessage);
}
