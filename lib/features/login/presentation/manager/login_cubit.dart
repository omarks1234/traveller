import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:traveller/features/login/domain/use_cases/loginUsecase.dart';

part 'login_state.dart';
@injectable
class LoginCubit extends Cubit<LoginState> {
  @factoryMethod
  LoginUseCase loginUseCase ;
  LoginCubit(this.loginUseCase) : super(LoginInitial());

  Future<void> login(String email ,String password)async{
    emit(LoginLoading()) ;
     final res = await loginUseCase.call(email, password) ;
     if (res == "Login has been done successfully "){
       emit(LoginSuccess(res));
     }else{
       emit(LoginError(res));
     }
  }
}
