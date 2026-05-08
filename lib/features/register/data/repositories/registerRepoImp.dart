import 'package:injectable/injectable.dart';
import 'package:traveller/features/register/data/data_sources/registerDaoInt.dart';
import 'package:traveller/features/register/domain/repositories/repoInt.dart';
@Injectable(as:RepoInt)
class RegisterRepoImp extends RepoInt{
  @factoryMethod
  RegisterDaoInt registerDao ;
  RegisterRepoImp(this.registerDao);
  @override
  Future<String> createEmail(String email, String password) {
   var response = registerDao.createEmail(email, password);
   return response ;
  }

}