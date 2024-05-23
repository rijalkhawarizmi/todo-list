part of 'delete_tasks_cubit.dart';

sealed class DeleteTasksState extends Equatable {
  const DeleteTasksState();

  @override
  List<Object> get props => [];
}

final class DeleteTasksInitial extends DeleteTasksState {}

final class DeleteTasksLoading extends DeleteTasksState {}

final class DeleteTasksSuccess extends DeleteTasksState {
  final String message;
  const DeleteTasksSuccess({required this.message});
}

final class DeleteTasksFailed extends DeleteTasksState {
  final String message;
  const DeleteTasksFailed({required this.message});
}
