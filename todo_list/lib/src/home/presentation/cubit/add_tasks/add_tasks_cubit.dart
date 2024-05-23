import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list/src/home/domain/usecases/add_tasks.dart';

part 'add_tasks_state.dart';

class AddTasksCubit extends Cubit<AddTasksState> {
  AddTasksCubit({required AddTasksUseCase addTasks})
      : _addTasks = addTasks,
        super(AddTasksInitial());

  final AddTasksUseCase _addTasks;

  void addTask(AddTasksParam param) async {
    emit(AddTasksLoading());
    final result = await _addTasks(param);
    result.fold(
        (failure) => emit(AddTasksFailed(message: failure.errorMessage)),
        (success) => emit(AddTasksSuccess(message: "Success add tasks")));
  }
}
