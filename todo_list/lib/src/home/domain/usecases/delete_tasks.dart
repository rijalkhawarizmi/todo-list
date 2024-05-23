import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/home_repository.dart';

class DeleteTasksUseCase extends UsecaseWithParams<void,int> {
  const DeleteTasksUseCase(this._homeRepository);
  final HomeRepository _homeRepository;

  @override
  ResultVoid call(int idTasks) async =>
      _homeRepository.deleteTasks(idTasks);
}



