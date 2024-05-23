part of 'update_tasks_cubit.dart';

sealed class UpdateTasksState extends Equatable {
  const UpdateTasksState();

  @override
  List<Object> get props => [];
}

final class UpdateTasksInitial extends UpdateTasksState {}

final class UpdateTasksLoading extends UpdateTasksState {}

final class UpdateTasksSuccess extends UpdateTasksState {
  final String message;
  const UpdateTasksSuccess({required this.message});
}

final class UpdateTasksFailed extends UpdateTasksState {
  final String message;
  const UpdateTasksFailed({required this.message});
}
