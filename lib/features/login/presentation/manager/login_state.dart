part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}
final class LoginLoading extends LoginState {}
final class LoginSuccess extends LoginState {
  String successMess ;
  LoginSuccess(this.successMess) ;
}
final class LoginError extends LoginState {
  String errMess ;
  LoginError(this.errMess) ;
}


