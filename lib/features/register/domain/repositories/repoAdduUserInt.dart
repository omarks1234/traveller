import 'package:traveller/features/register/data/models/user.dart';

abstract class RepoAddUserInt {
  Future<void> addUser (TravellerUser user) ;
}