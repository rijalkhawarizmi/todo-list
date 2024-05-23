
import '../../../../core/utils/typedef.dart';
abstract class AuthenticationRepository{
 const AuthenticationRepository();

 ResultFuture signIn({required String email,required String password});


}