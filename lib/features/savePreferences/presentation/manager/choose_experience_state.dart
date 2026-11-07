part of 'choose_experience_cubit.dart';



@immutable
sealed class ChooseExperienceState {}

final class ChooseExperienceInitialState extends ChooseExperienceState {}

final class ChooseExperienceLoadingState extends ChooseExperienceState {}

final class  ChooseExperienceSuccessState extends ChooseExperienceState {

}
final class ChooseExperienceErrorState extends ChooseExperienceState {
  String errorMessage;
  ChooseExperienceErrorState(this.errorMessage);
}



