import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/delete_tasks.dart';

part 'delete_tasks_state.dart';

class DeleteTasksCubit extends Cubit<DeleteTasksState> {
  DeleteTasksCubit({required DeleteTasksUseCase deleteTasksUseCase})
      : _deleteTasksUseCase = deleteTasksUseCase,
        super(DeleteTasksInitial());

  final DeleteTasksUseCase _deleteTasksUseCase;
  void deleteTasks(int idTasks) async {
    emit(DeleteTasksLoading());
    final result = await _deleteTasksUseCase(idTasks);
    result.fold(
        (failure) => emit(DeleteTasksFailed(message: failure.errorMessage)),
        (success) =>
            emit(const DeleteTasksSuccess(message: "Success Delete Tasks")));
  }
}
