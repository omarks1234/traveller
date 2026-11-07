import 'package:injectable/injectable.dart';
import 'package:traveller/features/login/data/data_sources/loginDaoInt.dart';
import 'package:traveller/features/register/firebase_services.dart';
@Injectable(as : LoginDaoInt)
class LoginFirebaseImp extends LoginDaoInt {
  @factoryMethod
  FireBaseServices fireBaseServices ;
  LoginFirebaseImp(this.fireBaseServices) ;
  @override
  Future<String> login(String email, String password)async {
   try{
     final result = await fireBaseServices.login(email, password);
     return result ;
   }catch(e){
     return e.toString() ;
   }
  }
}