import 'package:injectable/injectable.dart';
import 'package:traveller/features/login/domain/repositories/loginRepoInt.dart';
@injectable
class LoginUseCase{
  @factoryMethod
  LoginRepoInt loginRepoInt ;
  LoginUseCase(this.loginRepoInt);
   Future<String> call(String email , String password)async{
     try{
       final res = await loginRepoInt.login(email, password);
       return res ;
     }catch(e){
       return e.toString() ;
     }
   }
}