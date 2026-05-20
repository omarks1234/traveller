import 'package:injectable/injectable.dart';
import 'package:traveller/features/register/data/data_sources/addUserDao.dart';
import 'package:traveller/features/register/data/models/user.dart';

@injectable
class AddUserUseCase {
  @factoryMethod
  AddUserDao addUserDao;
  AddUserUseCase(this.addUserDao);
  Future<void> addUserCall(TravellerUser user) async{
   await addUserDao.addUser(user);
  }
}