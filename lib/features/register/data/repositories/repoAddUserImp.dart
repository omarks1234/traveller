 import 'package:injectable/injectable.dart';
import 'package:traveller/features/register/data/data_sources/addUserDao.dart';
import 'package:traveller/features/register/data/models/user.dart';
import 'package:traveller/features/register/domain/repositories/repoAdduUserInt.dart';
@Injectable(as:RepoAddUserInt)
class RepoAddUserImp extends RepoAddUserInt {
  AddUserDao addUserDao ;
  RepoAddUserImp(this.addUserDao);
  @override
  Future<void> addUser(TravellerUser user)async {
    try{
      await addUserDao.addUser(user);
    }catch(e){
      // toast Message
    }
  }

}