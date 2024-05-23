// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String? access_token;
  final String? refresh_token;
  const AuthEntity({
    this.access_token,
    this.refresh_token,
  });

  @override
  List<Object?> get props => [access_token, refresh_token];
}
