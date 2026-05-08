import 'package:injectable/injectable.dart';
import 'package:traveller/features/register/domain/repositories/repoInt.dart';

@injectable
class RegisterUseCase {
 RepoInt repo ;
 RegisterUseCase(this.repo);
 Future<String>call(String email , String password){
   var response = repo.createEmail(email, password);
   return response ;
 }
}