import 'package:injectable/injectable.dart';
import 'package:traveller/features/register/data/data_sources/addUserDao.dart';
import 'package:traveller/features/register/data/models/user.dart';
import 'package:traveller/features/register/firebase_services.dart';
@Injectable(as:AddUserDao)
class AddUserFirebaseImp extends AddUserDao{
  @factoryMethod
  FireBaseServices fireBaseServices ;
  AddUserFirebaseImp(this.fireBaseServices);
  @override
  Future<void> addUser(TravellerUser user) async {
     try{
       await  fireBaseServices.saveUserData(user)  ;
     }catch(e){
       // toast message
     }
  }

}