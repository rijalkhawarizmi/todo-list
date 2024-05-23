

import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:todo_list/src/authentication/data/models/authentication_model.dart';
import 'package:todo_list/src/authentication/domain/entities/user.dart';

class SharedStorage{
  static const _storage = FlutterSecureStorage();
static saveAuth({AuthModel? authModel}) async {
    await _storage.write(
        key: 'AUTHMODEL', value: jsonEncode(authModel?.toJson()));
  }

  static Future<AuthModel?> getAuth() async {
    String? data = await _storage.read(key: 'AUTHMODEL');
    if (data != null) {
      String decode = await jsonDecode(data);
      final authModel =AuthModel.fromJson(decode);
      return authModel;
    } else {
      return null;
    }
  }

  static removeAuth() async {
    await _storage.delete(key: 'AUTHMODEL');
  }
}


