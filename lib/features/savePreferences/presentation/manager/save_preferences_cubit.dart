import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:traveller/features/savePreferences/domain/use_cases/savePreferencesUseCase.dart';

part 'save_preferences_state.dart';
@injectable
class SavePreferencesCubit extends Cubit<SavePreferencesState> {
  SavePreferencesUseCase savePreferencesUseCase ;
  @factoryMethod
  SavePreferencesCubit(this.savePreferencesUseCase) : super(SavePreferencesInitialState());

  Future<void> savePreference (Map<String , dynamic> preferences)async{
    emit(SavePreferencesLoadingState());
    final response = await savePreferencesUseCase.call(preferences);
    response.fold(
      (l) => emit(SavePreferencesSuccessState()),
      (r) => emit(SavePreferencesErrorState(r)),
    );

  }

}
