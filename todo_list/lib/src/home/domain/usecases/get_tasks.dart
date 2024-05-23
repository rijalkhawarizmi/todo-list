import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/typedef.dart';
import '../entities/tasks_entity.dart';
import '../repositories/home_repository.dart';

class GetTasks extends UsecaseWithoutParams<List<TasksEntity>> {
  const GetTasks(this._homeRepository);
  final HomeRepository _homeRepository;

  @override
  ResultFuture<List<TasksEntity>> call() async =>
      _homeRepository.getTasks();
}
