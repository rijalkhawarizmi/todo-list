part of 'get_tasks_cubit.dart';

sealed class GetTasksState extends Equatable {
  const GetTasksState();
  @override
  List<Object> get props => [];
}

class GetTasksInitial extends GetTasksState {}

class GetTasksEmpty extends GetTasksState {
  final String message;
  const GetTasksEmpty({required this.message});
}

class GetTasksLoading extends GetTasksState {
  @override
  List<Object> get props => [];
}

class GetTasksSuccess extends GetTasksState {
  final TreeNode<TreeData> treeNode;
  final List<TasksEntity> tasksEnity;
  const GetTasksSuccess({required this.tasksEnity, required this.treeNode});
  @override
  List<Object> get props => [tasksEnity];
}

class GetTasksFailed extends GetTasksState {
  final String message;
  const GetTasksFailed({required this.message});
  @override
  List<Object> get props => [message];
}
