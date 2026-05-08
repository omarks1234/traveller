import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:traveller/features/register/domain/use_cases/register_useCase.dart';

part 'sign_in_model_view_state.dart';
@injectable
class SignInModelViewCubit extends Cubit<SignInModelViewState> {
  @factoryMethod
  RegisterUseCase registerUseCase ;
    SignInModelViewCubit(this.registerUseCase) : super(SignInModelViewInitial());

  Future<void> signIn(String email , String password)async{
    emit(SignInModelViewLoading());

    var response  = await registerUseCase.call(email, password);
    if (response == "you have been Registered"){
      emit(SignInModelViewSuccess(response));
    }else{
      emit(SignInModelViewFail(response));

    }

  }

}
