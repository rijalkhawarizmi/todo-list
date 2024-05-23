import 'package:dio/dio.dart';
import 'package:todo_list/core/utils/shared_storage.dart';
import 'package:todo_list/src/home/domain/usecases/add_tasks.dart';
import 'package:todo_list/src/home/domain/usecases/update_tasks.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/typedef.dart';
import '../models/tasks_model.dart';

abstract class HomeRemoteDataSource {
  Future<List<TasksModel>> getTask();
  Future<void> addTasks(AddTasksParam param);
  Future<void> deleteTasks(int idTasks);
  Future<void> updateTasks(UpdateTasksParams updateTasksParams);
}

class HomeRemoteDataSrcImpl implements HomeRemoteDataSource {
  HomeRemoteDataSrcImpl(this._dio);
  final Dio _dio;

  @override
  Future<List<TasksModel>> getTask() async {
    try {
      final authModel = await SharedStorage.getAuth();
      final response = await _dio.get(
        '$baseUrl/tasks',
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": authModel?.access_token
          },
        ),
      );

      if (response.statusCode == 200) {
        return List<DataMap>.from(response.data["data"] as List)
            .map((data) => TasksModel.fromMap(data))
            .toList();
      } else {
        throw ApiException(message: response.data["message"]);
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        SharedStorage.removeAuth();
        throw ApiException(message: e.response!.statusMessage!);
      } else {
        throw ApiException(message: e.response!.statusMessage!);
      }
    }
  }

  @override
  Future<void> addTasks(AddTasksParam param) async {
    // TODO: implement createTask
    try {
      final authModel = await SharedStorage.getAuth();
      Map map = {
        "title": param.title,
        "description": param.title,
        "record_type": "TO_DO",
        "recurrence": "DAILY",
        "parent_id": null
      };
      final response = await _dio.post('$baseUrl/tasks',
          options: Options(
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json",
              "Authorization": authModel?.access_token
            },
          ),
          data: map);

      if (response.statusCode == 201) {
        return response.data;
      } else {
        throw ApiException(message: response.data["message"]);
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        SharedStorage.removeAuth();
        throw ApiException(message: e.response!.statusMessage!);
      } else {
        throw ApiException(message: e.response!.statusMessage!);
      }
    }
  }

  @override
  Future<void> deleteTasks(int idTasks) async {
    // TODO: implement deleteTasks
    try {
      final authModel = await SharedStorage.getAuth();

      final response = await _dio.delete(
        '$baseUrl/tasks/$idTasks',
        options: Options(
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json",
            "Authorization": authModel?.access_token
          },
        ),
      );

      if (response.statusCode == 204) {
        return response.data;
      } else {
        throw ApiException(message: response.data["message"]);
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        SharedStorage.removeAuth();
        throw ApiException(message: e.response!.statusMessage!);
      } else {
        throw ApiException(message: e.response!.statusMessage!);
      }
    }
  }

  @override
  Future<void> updateTasks(UpdateTasksParams params) async {
    // TODO: implement updateTasks
    try {
      final authModel = await SharedStorage.getAuth();
      Map map = {
        "title": params.title,
        "description": params.title,
        "record_type": "TO_DO",
        "recurrence": "DAILY",
        "parent_id": null
      };
      final response = await _dio.patch('$baseUrl/tasks/${params.id}',
          options: Options(
            headers: {
              "Accept": "application/json",
              "Content-Type": "application/json",
              "Authorization": authModel?.access_token
            },
          ),
          data: map);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw ApiException(message: response.data["message"]);
      }
    } on DioException catch (e) {
      if (e.response!.statusCode == 401) {
        SharedStorage.removeAuth();
        throw ApiException(message: e.response!.statusMessage!);
      } else {
        throw ApiException(message: e.response!.statusMessage!);
      }
    }
  }
}
