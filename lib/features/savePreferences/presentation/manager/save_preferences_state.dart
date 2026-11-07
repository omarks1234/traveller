part of 'save_preferences_cubit.dart';

@immutable
sealed class SavePreferencesState {}

final class SavePreferencesInitialState extends SavePreferencesState {}

final class SavePreferencesLoadingState extends SavePreferencesState {}

final class SavePreferencesSuccessState extends SavePreferencesState {

}
final class SavePreferencesErrorState extends SavePreferencesState {
  String errorMessage;
  SavePreferencesErrorState(this.errorMessage);
}


