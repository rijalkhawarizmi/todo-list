part of 'add_tasks_cubit.dart';

sealed class AddTasksState extends Equatable {
  const AddTasksState();

  @override
  List<Object> get props => [];
}

final class AddTasksInitial extends AddTasksState {}

final class AddTasksLoading extends AddTasksState {}

final class AddTasksSuccess extends AddTasksState {
  final String message;
  const AddTasksSuccess({required this.message});
}

final class AddTasksFailed extends AddTasksState {
  final String message;
  const AddTasksFailed({required this.message});
}
