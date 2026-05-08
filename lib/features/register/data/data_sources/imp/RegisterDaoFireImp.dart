import 'package:injectable/injectable.dart';
import 'package:traveller/features/register/data/data_sources/registerDaoInt.dart';
import 'package:traveller/features/register/firebase_services.dart';
@Injectable(as:RegisterDaoInt)
class RegisterDaoFirebaseImp extends RegisterDaoInt{
  @factoryMethod
  FireBaseServices fireBaseServices ;
  RegisterDaoFirebaseImp(this.fireBaseServices);
  @override
  Future<String> createEmail(String email, String password) {
    // TODO: implement createEmail
    var response =fireBaseServices.createEmail(email, password);
    return response ;
  }

}