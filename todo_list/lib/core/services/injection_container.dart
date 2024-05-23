import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:todo_list/src/home/domain/usecases/add_tasks.dart';
import 'package:todo_list/src/home/domain/usecases/delete_tasks.dart';
import 'package:todo_list/src/home/domain/usecases/update_tasks.dart';
import 'package:todo_list/src/home/presentation/cubit/add_tasks/add_tasks_cubit.dart';
import 'package:todo_list/src/home/presentation/cubit/delete_tasks/delete_tasks_cubit.dart';
import 'package:todo_list/src/home/presentation/cubit/get_tasks/get_tasks_cubit.dart';
import 'package:todo_list/src/home/presentation/cubit/update_tasks/update_tasks_cubit.dart';
import '../../src/authentication/data/datasources/authentication_remote_data_source.dart';
import '../../src/authentication/data/repositories/authentication_repository_implementation.dart';
import '../../src/authentication/domain/repositories/authentication_repository.dart';
import '../../src/authentication/domain/usecases/signin_user.dart';
import '../../src/authentication/presentation/bloc/authentication_bloc.dart';
import '../../src/home/data/datasources/home_remote_data_source.dart';
import '../../src/home/data/repositories/home_repositories_implementation.dart';
import '../../src/home/domain/repositories/home_repository.dart';
import '../../src/home/domain/usecases/get_tasks.dart';
import '../../src/main/cubit/main_cubit.dart';

final sls = GetIt.instance;
Dio _dio = Dio();

Future<void> init() async {
  sls.registerLazySingleton(() => _dio);

  sls.registerFactory(() => MainCubit());

  sls
    ..registerFactory(() => AuthenticationBloc(signIn: sls()))
    ..registerLazySingleton(() => SignIn(sls()))
    ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImplementation(sls()))
    ..registerLazySingleton<AuthenticationRemoteDataSource>(
        () => AuthRemoteDataSrcImpl(sls()));

  sls
    ..registerFactory(() => GetTasksCubit(getTasks: sls()))
    ..registerFactory(() => AddTasksCubit(addTasks: sls()))
    ..registerLazySingleton(() => UpdateTasksCubit(updateTasksUseCase: sls()))
    ..registerLazySingleton(() => DeleteTasksCubit(deleteTasksUseCase: sls()))
    ..registerLazySingleton(() => GetTasks(sls()))
    ..registerLazySingleton(() => AddTasksUseCase(sls()))
    ..registerLazySingleton(() => DeleteTasksUseCase(sls()))
    ..registerLazySingleton(() => UpdateTasksUseCase(sls()))
    ..registerLazySingleton<HomeRepository>(
        () => HomeRepositoryImplementation(sls()))
    ..registerLazySingleton<HomeRemoteDataSource>(
        () => HomeRemoteDataSrcImpl(sls()));
}
