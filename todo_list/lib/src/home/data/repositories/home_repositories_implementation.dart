import 'package:dartz/dartz.dart';
import 'package:todo_list/src/home/domain/usecases/add_tasks.dart';
import 'package:todo_list/src/home/domain/usecases/update_tasks.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utils/typedef.dart';
import '../../domain/entities/tasks_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

class HomeRepositoryImplementation extends HomeRepository {
  HomeRepositoryImplementation(this._homeRemoteDataSource);
  final HomeRemoteDataSource _homeRemoteDataSource;
  @override
  ResultFuture<List<TasksEntity>> getTasks() async {
    // TODO: implement getListHome
    try {
      final result = await _homeRemoteDataSource.getTask();
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid addTasks(AddTasksParam addTasksParam) async {
    // TODO: implement addTasks
    try {
      final result = await _homeRemoteDataSource.addTasks(addTasksParam);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
  
  @override
  ResultVoid deleteTasks(int idTasks) async{
    // TODO: implement deleteTasks
    try {
      final result = await _homeRemoteDataSource.deleteTasks(idTasks);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultVoid updateTasks(UpdateTasksParams updateTasksParams)async {
    // TODO: implement updateTasks
    try {
      final result = await _homeRemoteDataSource.updateTasks(updateTasksParams);
      return Right(result);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }
}
