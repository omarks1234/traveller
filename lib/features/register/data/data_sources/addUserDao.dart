
import 'package:traveller/features/register/data/models/user.dart';

abstract class AddUserDao {
  Future<void> addUser (TravellerUser user) ;
}
