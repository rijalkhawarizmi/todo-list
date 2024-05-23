import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_list/src/home/domain/usecases/update_tasks.dart';

part 'update_tasks_state.dart';

class UpdateTasksCubit extends Cubit<UpdateTasksState> {
  UpdateTasksCubit({required UpdateTasksUseCase updateTasksUseCase})
      : _updateTasksUseCase = updateTasksUseCase,
        super(UpdateTasksInitial());

  final UpdateTasksUseCase _updateTasksUseCase;

  void updateTasks(UpdateTasksParams param) async {
    emit(UpdateTasksLoading());
    final result = await _updateTasksUseCase(param);
    result.fold(
        (failure) => emit(UpdateTasksFailed(message: failure.errorMessage)),
        (success) =>
            emit(const UpdateTasksSuccess(message: "Update Berhasil")));
  }
}
