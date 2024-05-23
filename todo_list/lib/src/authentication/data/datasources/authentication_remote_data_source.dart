import 'package:dio/dio.dart';
import 'package:todo_list/core/utils/shared_storage.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../models/authentication_model.dart';

abstract class AuthenticationRemoteDataSource {
  Future<AuthModel> signIn({required String email, required String password});
}

class AuthRemoteDataSrcImpl implements AuthenticationRemoteDataSource {
  AuthRemoteDataSrcImpl(this._dio);
  final Dio _dio;

  @override
  Future<AuthModel> signIn(
      {required String email, required String password}) async {
    try {
      final response = await _dio.post('$baseUrl/login', data: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        AuthModel authModel = AuthModel.fromMap(response.data);
        await SharedStorage.saveAuth(authModel: authModel);
        return authModel;
      } else {
        throw response.data["message"];
      }
    } on DioException catch (e) {
      throw ApiException(message: e.response?.data["message"]);
    }
  }
}
