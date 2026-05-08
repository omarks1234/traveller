part of 'sign_in_model_view_cubit.dart';

@immutable
sealed class SignInModelViewState {}
final class SignInModelViewInitial extends SignInModelViewState {}
final class SignInModelViewLoading extends SignInModelViewState {}
final class SignInModelViewSuccess extends SignInModelViewState {
  String successMess ;
  SignInModelViewSuccess(this.successMess);
}
final class SignInModelViewFail extends SignInModelViewState {
  String failMess ;
  SignInModelViewFail(this.failMess);
}



