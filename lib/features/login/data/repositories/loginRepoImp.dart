import 'package:injectable/injectable.dart';
import 'package:traveller/features/login/data/data_sources/loginDaoInt.dart';
import 'package:traveller/features/login/domain/repositories/loginRepoInt.dart';
@Injectable(as: LoginRepoInt)
class LoginRepoImp extends LoginRepoInt{
  @factoryMethod
  LoginDaoInt loginDaoInt ;
  LoginRepoImp(this.loginDaoInt);
  @override
  Future<String> login(String email, String password) async{
    try{
      final res = await loginDaoInt.login(email, password);
      return res ;
    }catch(e){
      return e.toString() ;
    }
  }
}