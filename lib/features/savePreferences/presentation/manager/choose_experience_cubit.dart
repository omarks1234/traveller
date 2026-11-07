import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:traveller/features/savePreferences/domain/use_cases/chooseExperienceUseCase.dart';

part 'choose_experience_state.dart';
@injectable
class ChooseExperienceCubit extends Cubit<ChooseExperienceState> {
  @factoryMethod
  final ChooseExperienceUseCase chooseExperienceUseCase ;
  ChooseExperienceCubit(this.chooseExperienceUseCase) : super(ChooseExperienceInitialState());
  Future<void> chooseExperience (Map<String , dynamic> trip , String tripId)async{
    emit(ChooseExperienceLoadingState());
    final response = await chooseExperienceUseCase.call(trip , tripId);
    response.fold(
          (l) => emit(ChooseExperienceSuccessState()),
          (r) => emit(ChooseExperienceErrorState(r)),
    );

  }


}
