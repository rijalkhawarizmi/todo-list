// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationLoading extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
  
 final AuthEntity authEntity;
 const AuthenticationSuccess({
    required this.authEntity,
  });
  

  @override
  List<Object> get props => [authEntity];
}

class AuthenticationError extends AuthenticationState {
  const AuthenticationError(this.message);

  final String message;

  @override
  List<Object> get props => [message];
}

class ObscurePassword extends AuthenticationState {
  final bool obscurePass;
  const ObscurePassword({required this.obscurePass});

   @override
  List<Object> get props => [obscurePass];
}

class ObscurePasswordConfirm1 extends AuthenticationState {
  final bool obscurePassConfirm1;
  const ObscurePasswordConfirm1({required this.obscurePassConfirm1});

   @override
  List<Object> get props => [obscurePassConfirm1];
}

class ObscurePasswordConfirm2 extends AuthenticationState {
  final bool obscurePassConfirm2;
  const ObscurePasswordConfirm2({required this.obscurePassConfirm2});

   @override
  List<Object> get props => [obscurePassConfirm2];
}
