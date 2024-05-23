import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/home_repository.dart';

class UpdateTasksUseCase extends UsecaseWithParams<void, UpdateTasksParams> {
  const UpdateTasksUseCase(this._homeRepository);
  final HomeRepository _homeRepository;

  @override
  ResultVoid call(UpdateTasksParams params) async =>
      _homeRepository.updateTasks(params);
}

class UpdateTasksParams extends Equatable {
  final int id;
  final String title;
  final String description;

  const UpdateTasksParams(
      {required this.id, required this.title, required this.description});

  @override
  // TODO: implement props
  List<Object?> get props => [title, description];
}
