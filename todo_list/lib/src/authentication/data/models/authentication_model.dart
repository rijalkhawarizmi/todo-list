// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import '../../domain/entities/user.dart';

class AuthModel extends AuthEntity {

  String? access_token;
  String? refresh_token;
 
  AuthModel({
    this.access_token,
    this.refresh_token,
  });


  AuthModel copyWith({
    String? access_token,
    String? refresh_token,
  }) {
    return AuthModel(
      access_token: access_token ?? this.access_token,
      refresh_token: refresh_token ?? this.refresh_token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'access_token': access_token,
      'refresh_token': refresh_token,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      access_token: map['access_token'] != null ? map['access_token'] as String : null,
      refresh_token: map['refresh_token'] != null ? map['refresh_token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) => AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AuthModel(access_token: $access_token, refresh_token: $refresh_token)';

  @override
  bool operator ==(covariant AuthModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.access_token == access_token &&
      other.refresh_token == refresh_token;
  }

  @override
  int get hashCode => access_token.hashCode ^ refresh_token.hashCode;
}
