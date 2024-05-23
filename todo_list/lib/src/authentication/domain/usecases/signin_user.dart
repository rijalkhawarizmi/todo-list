import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/authentication_repository.dart';

class SignIn extends UsecaseWithParams<void, SignInParams> {
  const SignIn(this._repository);

  final AuthenticationRepository _repository;

  

  @override
  ResultFuture call(SignInParams signInParams) {
    // TODO: implement call
    return _repository.signIn(
        email: signInParams.email, 
        password: signInParams.password);
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;
  

  const SignInParams(
      {required this.email, required this.password});
  
  
  @override
  // TODO: implement props
  List<Object?> get props => [email,password];
}
