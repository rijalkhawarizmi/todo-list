// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class EventAuthentication extends AuthenticationEvent{

  final String email;
  final String password;

  const EventAuthentication({required this.email,required this.password});

  @override
  List<Object> get props => [email,password];

}

class EventObscurePassword extends AuthenticationEvent {
  final bool obscurePassword;

  const EventObscurePassword({
   required this.obscurePassword
  });
  @override
  List<Object> get props => [obscurePassword];
}


class EventObscurePasswordConfirm1 extends AuthenticationEvent {
  final bool obscurePasswordConfirm1;

  const EventObscurePasswordConfirm1({
   required this.obscurePasswordConfirm1
  });
  @override
  List<Object> get props => [obscurePasswordConfirm1];
}

class EventObscurePasswordConfirm2 extends AuthenticationEvent {
  final bool obscurePasswordConfirm2;

  const EventObscurePasswordConfirm2({
   required this.obscurePasswordConfirm2
  });
  @override
  List<Object> get props => [obscurePasswordConfirm2];
}