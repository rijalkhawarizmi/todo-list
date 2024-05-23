import 'package:equatable/equatable.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../repositories/home_repository.dart';

class AddTasksUseCase extends UsecaseWithParams<void,AddTasksParam> {
  const AddTasksUseCase(this._homeRepository);
  final HomeRepository _homeRepository;

  @override
  ResultVoid call(AddTasksParam params) async =>
      _homeRepository.addTasks(params);
}


class AddTasksParam extends Equatable {
  final String title;
  final String description;
  

  const AddTasksParam(
      {required this.title, required this.description});
  
  
  @override
  // TODO: implement props
  List<Object?> get props => [title,description];
}


